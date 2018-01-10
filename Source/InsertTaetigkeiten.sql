INSERT INTO TAETIGKEIT
(DWS, ID, NAME, ZEITSEMESTER, KUERZEL, PRUEFERNUMMER)
SELECT vopl.Semesterwochenstunden as DWS, vopl.ID, vopl.NAME, vopl.zeitsemester, stud.KUERZEL, vopl.PRUEFERNUMMER 
FROM VORLESUNG_PLAN as vopl 
INNER JOIN Studiengang stud on vopl.studiengang_id = stud.id 
GROUP by vopl.semesterwochenstunden, vopl.id, vopl.name, vopl.zeitsemester, stud.kuerzel, vopl.pruefernummer;