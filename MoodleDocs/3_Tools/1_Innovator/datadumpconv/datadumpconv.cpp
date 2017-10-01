/*

datadumpconv - a little program to generate SQL INCLUDE statements
from SELECT * FROM <table> outputs

Input is a txt-file of the following layout:

TABLE
DOZENT

Datentyp-                     Spalten-   # Komma  Null-
Spaltenname                     schema    Datentypname        länge      stellen  zeichen
------------------------------- --------- ------------------- ---------- -------- ------
PRFRNR                          SYSIBM    INTEGER                      4     0 Nein  
NAME                            SYSIBM    VARCHAR                     20     0 Ja    
VORNAME                         SYSIBM    VARCHAR                     15     0 Ja    
FAKID                           SYSIBM    CHARACTER                    2     0 Ja    

4 Satz/Sätze ausgewählt.



PRFRNR      NAME                 VORNAME         FAKID
----------- -------------------- --------------- -----
          1 Dausmann             Manfred         IT   
          2 Mueller-Hoffmann     Frank           IT   
          3 Nonnast              Juergen         IT   
          4 Zieher               Martin          IT   
       1035 Schoop               Dominik         GS   

5 Satz/Sätze ausgewählt.


TABLE
LEHRBEAUFTRAGTER
...

*/

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
using namespace std;

char cs[256];
string l;
string n;
char t;
unsigned int state; 
string::size_type pos;

class Attribute
{
	string name;
	char type;  // c = character type, n = number type
	string::size_type width; // stores the width of the display column
public:
	Attribute(string n = "", char t = 'c', string::size_type w = 0) : name(n), type(t), width(w) {};
	string getName()
	{
		return name;
	}
	char getType()
	{
		return type;
	}
	void setName(string n)
	{
		name = n;
	}
	void setType(char t)
	{
		type = t;
	}
	void setWidth(string::size_type w)
	{
		width = w;
	}
	string::size_type getWidth()
	{
		return width;
	}
};

class Table
{
	string name;
	vector<Attribute> attrList;
public:
	Table()
	{
		attrList = vector<Attribute>();
	}
	void setName(string n)
	{
		name = n;
	}
	void addAttr(Attribute a)
	{
		attrList.push_back(a);
	}
	vector<Attribute> & getAttrList()
	{
		return attrList;
	}
	int numAttr()
	{
		return attrList.size();
	}
	string getName()
	{
		return name;
	}
	void emptyAttrList()
	{
		attrList.clear();
	}
};

void trim(string & str)
{
	// Removes ' 's at begin and end
	string::size_type pos = str.find_last_not_of(' ');
	if (pos != string::npos) 
	{
		str.erase(pos + 1);
		pos = str.find_first_not_of(' ');
		if (pos != string::npos) 
			str.erase(0, pos);
	}
	else 
		str.erase(str.begin(), str.end());
}

string getFirstWord(string & str)
{
	// Returns the first word of str (' ' beeing separator)
	// removes it from str and trims str
	string::size_type pos = str.find_first_of(' ');
	string s = str;
	if (pos != string::npos)
	{
		s = str.substr(0,pos);
		str.erase(0, pos);
		trim(str);
	}
	return s;
}

string getAttributeValue(string & str, string::size_type w)
{
	// Returns the first attribute value of width w of str
	// removes it from str
	string s = str.substr(0,w);
	trim(s);
	str.erase(0, w+1);
	return s;
}

int main(int argc, const char* argv[])
{
	if (argc>3)
	{
		cout << "Usage: datadumpconv <in file> <out file>" << endl;
		return 0;
	}
	//ifstream infile("C:\\in.txt ", ios::in);
	//ofstream outfile("C:\\out.sql");
	ifstream infile(argv[1]);
	ofstream outfile(argv[2]);
	if (!infile) cout << "File cannot be read." << endl; 
	if (!outfile) cout << "File cannot be opened for writing." << endl;
	state = 0;
	Table tab;
	try
	{
		while (infile.getline(cs,sizeof(cs),'\n'))
		{
			l = cs;
			pos = l.find_first_of(13);
			if (pos != string::npos)
				l.erase(pos);
			if (l.length()>0 && l.find_first_not_of(' ') != string::npos) // ignore empty lines
			{
				// 0: Look for keyword TABLE
				if (state == 0)
				{
					if (l.find("TABLE") != string::npos)
					{
						state = 1;
					}
				}
				// 1: searching for table name
				else if (state == 1)
				{
					trim(l);
					tab.setName(l);
					tab.emptyAttrList();
					state = 2;
				}
				// 2: searching for Spaltenname
				else if (state == 2 && l.find("Spaltenname") != string::npos)
				{
					state = 3;
				}
				else if (state == 3 && l.find("--") != string::npos)
				{
					state = 4;
				}
				// 4: reading in attributes and their types
				else if (state == 4)
				{
					if (l.find("Sätze ausgewählt") != string::npos)  // end of attribute list reached
					{
						// write INSERT INTO ...
						outfile << "ECHO TABLE " << tab.getName() << " ;" << endl;
						outfile << "INSERT INTO " << tab.getName() << endl;
						outfile << "(";
						for (int i=0; i<tab.numAttr(); i++)
						{
							outfile << tab.getAttrList()[i].getName();
							if (i+1 < tab.numAttr())
								outfile << ", ";
						}
						outfile << ")" << endl;
						outfile << "VALUES" << endl;
						state = 5;
					}
					else
					{
						Attribute a;
						a.setName(getFirstWord(l));       // read Spaltenname
						getFirstWord(l);                  // read Datentypschema
						n = getFirstWord(l);              // read Datentypname
						if (n == "INTEGER" || n == "REAL" || n == "DOUBLE" || n == "NUMERIC" || n == "DECIMAL" || n == "SMALLINT") 
							a.setType('n');
						else
							a.setType('c');
						tab.addAttr(a);
					}
				}
				// 5: searching heading underline to determine column width
				else if (state == 5)
				{
					// Ignoring the line with headings
					state = 6;
				}
				// 6: parsing heading underline (---) to determine column width
				else if (state == 6)
				{
					int i;
					for (i = 0; i+1 < tab.numAttr(); i++)
					{
						pos = l.find_first_of(' ');
						tab.getAttrList()[i].setWidth(pos);
						l.erase(0,pos+1);
					}
					tab.getAttrList()[i].setWidth(l.length());
					state = 7;
				}
				// 7: searching attribute values
				else if (state >= 7)
				{
					if (l.find("Sätze ausgewählt") != string::npos)
					{
						outfile << ";" << endl << endl;
						state = 0;
					}
					else
					{
						if (state == 8)
							outfile << "," << endl;
						outfile << "( ";
						for (int i = 0; i<tab.numAttr(); i++)
						{
							n = getAttributeValue(l, tab.getAttrList()[i].getWidth());
							if ( n == "-" )
							{
								outfile << "NULL";
							}
							else
							{
								if (tab.getAttrList()[i].getType() == 'c')
									outfile << '\'';
								outfile << n;
								if (tab.getAttrList()[i].getType() == 'c')
									outfile << '\'';
							}
							if (i+1 < tab.numAttr())
								outfile << ", ";
						}
						outfile << " )";
						state = 8;
					}
				}
			}
		}
	}

	catch (...)
	{
		cout << "EXCEPTION" << endl;
	}
	infile.close();
	outfile.close();
}
