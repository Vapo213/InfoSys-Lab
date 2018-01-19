CONNECT TO LABOR;

DROP TABLE TD_SPO;
CREATE TABLE TD_SPO
(
    Studiengang CHAR(4) NOT NULL,   -- IT KTB SWB SWM SWT TIB
    Semester CHAR(4),               -- Semester (1-7)
    ModulNr INT NOT NULL,           -- Modulnr z.B. 101
    Modulname VARCHAR(40),          -- Modulname
    Credits INT,                    -- Creditpoints = SWS
    Teilgebiet VARCHAR(40) NOT NULL,-- Teil eines Moduls
    CONSTRAINT TD_SPO_PK PRIMARY KEY (Studiengang, ModulNr, Teilgebiet)
);

INSERT INTO TD_SPO
  (Studiengang, Semester, ModulNr, Modulname, Credits, Teilgebiet)
VALUES
-- STUDIENGANG,SEMESTER,MODULNR,MODULNAME,CREDITS,TEILGEBIET
('IT',1,101,'Mathematik 1',10,'Mathematik 1'),
('IT',1,102,'Physik 1',5,'Physik 1'),
('IT',1,103,'Elektrotechnik 1',4,'Elektrotechnik 1'),
('IT',1,103,'Elektrotechnik 1',1,'Labor Elektrotechnik 1'),
('IT',1,104,'Informatik 1',3,'Informatik 1'),
('IT',1,104,'Informatik 1',2,'Labor Informatik 1'),
('IT',1,105,'Ingenieurmethodiken 1',3,'Persoenlichkeitsentwicklung'),
('IT',1,105,'Ingenieurmethodiken 1',2,'Technisches Englisch'),
('IT',2,201,'Mathematik 2',4,'Labor Mathematik 2'),
('IT',2,201,'Mathematik 2',1,'Mathematik 2'),
('IT',2,202,'Physik 2',1,'Labor Physik 2'),
('IT',2,202,'Physik 2',4,'Physik 2'),
('IT',2,203,'Elektrotechnik 2',4,'Elektrotechnik 2'),
('IT',2,203,'Elektrotechnik 2',1,'Labor Elektrotechnik 2'),
('IT',2,204,'Elektronik',4,'Elektronik'),
('IT',2,204,'Elektronik',1,'Projekt Elektronik 2'),
('IT',2,205,'Informatik 2',3,'Informatik 2'),
('IT',2,205,'Informatik 2',2,'Projekt Informatik 2'),
('IT',2,206,'Computerarchitektur 1',4,'Computerarchitektur 1'),
('IT',2,206,'Computerarchitektur 1',1,'Labor Computerarchitektur 1'),
('IT',3,301,'Mathematik 3',5,'Mathematik 3'),
('IT',3,302,'Informatik 3',3,'Informatik 3'),
('IT',3,302,'Informatik 3',2,'Labor Informatik 3'),
('IT',3,303,'Computerarchitektur 2',4,'Computerarchitektur 2'),
('IT',3,303,'Computerarchitektur 2',1,'Labor Computerarchitektur 2'),
('IT',3,304,'Signale und Systeme',4,'Labor Signale und Systeme'),
('IT',3,304,'Signale und Systeme',1,'Signale und Systeme'),
('IT',3,305,'Betriebssysteme',4,'Betriebssysteme'),
('IT',3,305,'Betriebssysteme',1,'Labor Betriebssysteme'),
('IT',3,306,'Datenbanken 1',4,'Datenbanken 1'),
('IT',3,306,'Datenbanken 1',1,'Labor Datenbanken 1'),
('IT',4,401,'Betriebswirtschaft',4,'Betriebswirtschaft'),
('IT',4,401,'Betriebswirtschaft',1,'Projektmanagement'),
('IT',4,402,'Computerarchitektur 3',4,'Computerarchitektur 3'),
('IT',4,402,'Computerarchitektur 3',1,'Labor Computerarchitektur 3'),
('IT',4,403,'Systemtechnik 1',1,'Labor Systemtechnik 1'),
('IT',4,403,'Systemtechnik 1',4,'Systemtechnik 1'),
('IT',4,404,'Echtzeitsysteme',4,'Echtzeitsysteme'),
('IT',4,404,'Echtzeitsysteme',1,'Labor Echtzeitsysteme'),
('IT',4,405,'Rechnernetze 1',1,'Labor Rechnernetze 1'),
('IT',4,405,'Rechnernetze 1',4,'Rechnernetze 1'),
('IT',4,406,'Objektorientierte Systeme 1',2,'Labor Objektorientierte Systeme 1'),
('IT',4,406,'Objektorientierte Systeme 1',3,'Objektorientierte Systeme 1'),
('IT',5,501,'Praktisches Studiensemester',26,'Betriebliche Praxis'),
('IT',5,502,'Ingenieurmethodiken 2',4,'Ingenieurmethodiken 2'),
('IT',6,601,'Studienarbeit',5,'Studienarbeit'),
('IT',7,701,'Wahlpflichtf�cher',6,'Wahlpflichtfaecher'),
('IT',7,702,'Wissenschaftliche Vertiefung',9,'Wissenschaftliche Vertiefung'),
('IT',7,703,'Bachelorarbeit',12,'Bachelorarbeit'),
('IT',7,703,'Bachelorarbeit',3,'Kolloquium'),
('KTB',6,602,'Digitale Signalverarbeitung',4,'Digitale Signalverarbeitung'),
('KTB',6,602,'Digitale Signalverarbeitung',1,'Labor Digitale Signalverarbeitung'),
('KTB',6,603,'Rechnernetze 2',1,'Labor Rechnernetze 2'),
('KTB',6,603,'Rechnernetze 2',4,'Rechnernetze 2'),
('KTB',6,604,'Bussysteme',4,'Bussysteme'),
('KTB',6,604,'Bussysteme',1,'Labor Bussysteme'),
('KTB',6,605,'Funk- und Festnetze',4,'Funk- und Festnetze'),
('KTB',6,605,'Funk- und Festnetze',1,'Labor Funk- und Festnetze'),
('KTB',6,606,'Digitale Medien',4,'Digitale Medien'),
('KTB',6,606,'Digitale Medien',1,'Labor Digitale Medien'),
('SWM',6,611,'Datenbanken 2',3,'Datenbanken 2'),
('SWM',6,611,'Datenbanken 2',2,'Projekt Datenbanken 2'),
('SWM',6,612,'Digitale Medien',4,'Digitale Medien'),
('SWM',6,612,'Digitale Medien',1,'Labor Digitale Medien'),
('SWM',6,613,'Virtuelle Realitaet',1,'Labor Virtuelle Realitaet'),
('SWM',6,613,'Virtuelle Realitaet',4,'Virtuelle Realitaet'),
('SWM',6,614,'Grafische Benutzungsoberflaechen',4,'Grafische Benutzungsoberflaechen'),
('SWM',6,614,'Grafische Benutzungsoberflaechen',1,'Labor Grafische Benutzungsoberflaechen'),
('SWM',6,615,'Interaktive Systeme',4,'Interaktive Systeme'),
('SWM',6,615,'Interaktive Systeme',1,'Labor Interaktive Systeme'),
('SWT',6,611,'Datenbanken 2',3,'Datenbanken 2'),
('SWT',6,611,'Datenbanken 2',2,'Projekt Datenbanken 2'),
('SWT',6,614,'Grafische Benutzungsoberflaechen',4,'Grafische Benutzungsoberflaechen'),
('SWT',6,614,'Grafische Benutzungsoberflaechen',1,'Labor Grafische Benutzungsoberflaechen'),
('SWT',6,621,'Rechnerbetrieb',1,'Labor Rechnerbetrieb'),
('SWT',6,621,'Rechnerbetrieb',4,'Rechnerbetrieb'),
('SWT',6,622,'Objektorientierte Systeme 2',1,'Labor Objektorientierte Systeme 2'),
('SWT',6,622,'Objektorientierte Systeme 2',4,'Objektorientierte Systeme 2'),
('SWT',6,623,'Softwarearchitektur',1,'Labor Softwarearchitekturen'),
('SWT',6,623,'Softwarearchitektur',4,'Softwarearchitektur'),
('TIB',6,602,'Digitale Signalverarbeitung',4,'Digitale Signalverarbeitung'),
('TIB',6,602,'Digitale Signalverarbeitung',1,'Labor Digitale Signalverarbeitung'),
('TIB',6,603,'Systemtechnik 2',1,'Labor Systemtechnik 2'),
('TIB',6,603,'Systemtechnik 2',4,'Systemtechnik 2'),
('TIB',6,604,'Maschinelles Sehen',1,'Labor Maschinelles Sehen'),
('TIB',6,604,'Maschinelles Sehen',4,'Maschinelles Sehen'),
('TIB',6,605,'Embedded Systems Software',4,'Embedded Systems Software'),
('TIB',6,605,'Embedded Systems Software',1,'Labor Embedded Systems Software'),
('TIB',6,606,'Bussysteme',1,'Labor Bussysteme'),
('TIB',6,606,'Bussysteme',4,'Bussysteme');