--INSERT INTO VORLESUNG_REAL
--(NAME, VORLESUNGSBLOCK, ID_TAETIGKEIT)
SELECT taet.name, stdpl.tag concat stdpl.stunde as Vorlesungsblock, taet.id 
FROM taetigkeit as taet
inner join TD_STDPL as stdpl
on taet.name = stdpl.fach
group by taet.name, stdpl.tag concat stdpl.stunde, taet.id;
