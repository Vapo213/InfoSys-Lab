--Getting connected from private PC

--copy the following commands in a file 
--and execute it using:
--db2 -tf <filename>

ECHO uncatalog if any ...;

UNCATALOG ODBC DATA SOURCE labor;
UNCATALOG ODBC DATA SOURCE project;
UNCATALOG ODBC DATA SOURCE sample;

UNCATALOG DATABASE labor;
UNCATALOG DATABASE project;
UNCATALOG DATABASE sample;

UNCATALOG NODE lab_pri;

UNCATALOG NODE pri_srv;
quit;
--------------------------------------------------------------------------------
ECHO catalog server ...;

CATALOG ADMIN TCPIP NODE pri_srv
REMOTE itnt0002.hs-esslingen.de
SYSTEM  pri
--OSTYPE  NT64
;

CATALOG TCPIP NODE lab_pri
REMOTE itnt0002.hs-esslingen.de
SERVER 50002 
REMOTE_INSTANCE lab 
--SYSTEM itnt0002.hs-esslingen.de 
SYSTEM pri
OSTYPE NT  
WITH 'Primary Lab-Instance' 
;

--------------------------------------------------------------------------------

ECHO catalog databases ...;

CATALOG DATABASE labor
AS labor
AT NODE lab_pri
AUTHENTICATION CLIENT 
WITH "Exercises --" 
;  

CATALOG DATABASE project
AS project
AT NODE lab_pri
AUTHENTICATION CLIENT 
WITH "Project in Databases --" 
; 

CATALOG DATABASE sample  
AT NODE lab_pri
AUTHENTICATION CLIENT 
WITH "Sample comes with IBM --" 
; 

CATALOG USER ODBC DATA SOURCE labor;
CATALOG USER ODBC DATA SOURCE project;
CATALOG USER ODBC DATA SOURCE sample;

--------------------------------------------------------------------------------

ECHO verifiy catalog entries ...;

LIST NODE DIRECTORY SHOW DETAIL;
LIST DATABASE DIRECTORY SHOW DETAIL; 
LIST ODBC DATA SOURCES; 
 


