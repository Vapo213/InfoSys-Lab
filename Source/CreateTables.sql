CREATE TABLE ANSCHRIFT
	( ID smallint NOT NULL
	,	PLZ integer
	, HAUSNUMMER char(3)
	, STRASSE char(100)
	, ORT char(100) )
;

CREATE TABLE DOZENT
	( PRIVATMAIL char(100)
	, HSMAIL char(100)
	, TELEFONNUMMER integer
	, PRUEFERNUMMER integer NOT NULL
	, TITEL char(100) NOT NULL
	, NACHNAME char(100) NOT NULL
	, KUERZEL char(5) NOT NULL
	, ADRESSID smallint NOT NULL )
;

CREATE TABLE FAKULTAET
	( NAME char(100) NOT NULL
	, KUERZEL char(5) NOT NULL )
;

CREATE TABLE KANN_VORLESUNG_ANBIETEN
	( PRUEFERNUMMER integer NOT NULL
	, ID integer NOT NULL )
;

CREATE TABLE LEGT_VORLESUNGEN_FEST
	( ID integer NOT NULL
	, ID_434 integer NOT NULL )
;

CREATE TABLE LEGT_VORLESUNG_FEST
	( ID integer NOT NULL
	, ID_436 integer NOT NULL )
;

CREATE TABLE LEHRBEAUFTRAGTER
	( ZEITFENSTER integer NOT NULL
	, PRUEFERNUMMER integer NOT NULL )
;

CREATE TABLE LEHRPLAN
	( EINSTUFUNG char(5) NOT NULL
	, ID integer NOT NULL )
;

CREATE TABLE LEHRT
	( PRUEFERNUMMER integer NOT NULL
	, ID integer NOT NULL )
;

CREATE TABLE PROFESSOR
	( DWS smallint NOT NULL
	, VORLESUNGSKONTIGENT integer NOT NULL
	, ZEITSEMESTER char(6) NOT NULL
	, PRUEFERNUMMER integer NOT NULL )
;

CREATE TABLE RAUM
	( NUMMER integer NOT NULL
	, GEBAEUDE smallint NOT NULL
	, STANDORT char(1) NOT NULL
	, ID integer NOT NULL )
;

CREATE TABLE STUDIENGANG
	( ID integer NOT NULL
	, PRUEFUNGSORDNUNG char(100) NOT NULL
	, ABSCHLUSS char(100) NOT NULL
	, ZEITSEMESTER char(100) NOT NULL
	, NAME char(100) NOT NULL
	, KUERZEL char(5) NOT NULL )
;

CREATE TABLE STUDIENSEMESTER
	( EINSTUFUNG char(5) NOT NULL )
;

CREATE TABLE TAETIGKEIT
	( DWS smallint NOT NULL
	, ID integer NOT NULL
	, NAME char(100) NOT NULL
	, ZEITSEMESTER char(6) NOT NULL
	, KUERZEL char(5) NOT NULL
	, PRUEFERNUMMER integer NOT NULL )
;

CREATE TABLE VORLESUNG_PLAN
	( ID integer NOT NULL
	, ZEITSEMESTER char(6) NOT NULL
	, SEMESTERWOCHENSTUNDEN smallint NOT NULL
	, NAME char(100) NOT NULL
	, PRUEFERNUMMER integer NOT NULL
 	, STUDIENGANG_ID integer NOT NULL)
;

CREATE TABLE VORLESUNG_REAL
	( ID integer NOT NULL
	, NAME char(100) NOT NULL
	, VORLESUNGSBLOCK char(100) NOT NULL
	, ID_TAETIGKEIT integer NOT NULL )
;

CREATE TABLE BELEGT__VORLESUNG
	( EINSTUFUNG char(5) NOT NULL
	, ID integer NOT NULL)
;

ALTER TABLE ANSCHRIFT
	ADD CONSTRAINT PK PRIMARY KEY
	( ID );

ALTER TABLE BELEGT__VORLESUNG
	ADD CONSTRAINT PK PRIMARY KEY
	( EINSTUFUNG
	, ID );

ALTER TABLE DOZENT
	ADD CONSTRAINT PK PRIMARY KEY
	( PRUEFERNUMMER );

ALTER TABLE FAKULTAET
	ADD CONSTRAINT PK PRIMARY KEY
	( KUERZEL );

ALTER TABLE KANN_VORLESUNG_ANBIETEN
	ADD CONSTRAINT PK PRIMARY KEY
	( PRUEFERNUMMER
	, ID );

ALTER TABLE LEGT_VORLESUNGEN_FEST
	ADD CONSTRAINT PK PRIMARY KEY
	( ID
	, ID_434 );

ALTER TABLE LEGT_VORLESUNG_FEST
	ADD CONSTRAINT PK PRIMARY KEY
	( ID
	, ID_436 );

ALTER TABLE LEHRBEAUFTRAGTER
	ADD CONSTRAINT PK PRIMARY KEY
	( PRUEFERNUMMER );

ALTER TABLE LEHRPLAN
	ADD CONSTRAINT PK PRIMARY KEY
	( EINSTUFUNG
	, ID );

ALTER TABLE LEHRT
	ADD CONSTRAINT PK PRIMARY KEY
	( PRUEFERNUMMER
	, ID );

ALTER TABLE PROFESSOR
	ADD CONSTRAINT PK PRIMARY KEY
	( PRUEFERNUMMER
	, ZEITSEMESTER );

ALTER TABLE RAUM
	ADD CONSTRAINT PK PRIMARY KEY
	( NUMMER
	, GEBAEUDE
	, STANDORT );

ALTER TABLE STUDIENGANG
	ADD CONSTRAINT PK PRIMARY KEY
	( ID );

ALTER TABLE STUDIENSEMESTER
	ADD CONSTRAINT PK PRIMARY KEY
	( EINSTUFUNG );

ALTER TABLE TAETIGKEIT
	ADD CONSTRAINT PK PRIMARY KEY
	( ID );

ALTER TABLE VORLESUNG_PLAN
	ADD CONSTRAINT PK PRIMARY KEY
	( ID );

ALTER TABLE VORLESUNG_REAL
	ADD CONSTRAINT PK PRIMARY KEY
	( ID );

ALTER TABLE BELEGT__VORLESUNG
	ADD CONSTRAINT BELEGT__VORLESUNG_STUDIENSEMESTER FOREIGN KEY
	( EINSTUFUNG )
	REFERENCES STUDIENSEMESTER
	( EINSTUFUNG )
	ON DELETE CASCADE;

ALTER TABLE BELEGT__VORLESUNG
	ADD CONSTRAINT BELEGT__VORLESUNG_VORLESUNG_REAL FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_REAL
	( ID )
	ON DELETE CASCADE;

ALTER TABLE DOZENT
	ADD CONSTRAINT DOZENT_FAKULTAET FOREIGN KEY
	( KUERZEL )
	REFERENCES FAKULTAET
	( KUERZEL );

ALTER TABLE DOZENT
	ADD CONSTRAINT DOZENT_ANSCHRIFT FOREIGN KEY
	( ADRESSID )
	REFERENCES ANSCHRIFT
	( ID );

ALTER TABLE KANN_VORLESUNG_ANBIETEN
	ADD CONSTRAINT KANN_VORLESUNG_ANBIETEN_DOZENT FOREIGN KEY
	( PRUEFERNUMMER )
	REFERENCES DOZENT
	( PRUEFERNUMMER )
	ON DELETE CASCADE;

ALTER TABLE KANN_VORLESUNG_ANBIETEN
	ADD CONSTRAINT KANN_VORLESUNG_ANBIETEN_VORLESUNG_PLAN FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_PLAN
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEGT_VORLESUNGEN_FEST
	ADD CONSTRAINT LEGT_VORLESUNGEN_FEST_STUDIENGANG FOREIGN KEY
	( ID )
	REFERENCES STUDIENGANG
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEGT_VORLESUNGEN_FEST
	ADD CONSTRAINT LEGT_VORLESUNGEN_FEST_VORLESUNG_PLAN FOREIGN KEY
	( ID_434 )
	REFERENCES VORLESUNG_PLAN
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEGT_VORLESUNG_FEST
	ADD CONSTRAINT LEGT_VORLESUNG_FEST_VORLESUNG_REAL FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_REAL
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEGT_VORLESUNG_FEST
	ADD CONSTRAINT LEGT_VORLESUNG_FEST_VORLESUNG_PLAN FOREIGN KEY
	( ID_436 )
	REFERENCES VORLESUNG_PLAN
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEHRBEAUFTRAGTER
	ADD CONSTRAINT LEHRBEAUFTRAGTER_DOZENT FOREIGN KEY
	( PRUEFERNUMMER )
	REFERENCES DOZENT
	( PRUEFERNUMMER )
	ON DELETE CASCADE;

ALTER TABLE LEHRPLAN
	ADD CONSTRAINT LEHRPLAN_STUDIENSEMESTER FOREIGN KEY
	( EINSTUFUNG )
	REFERENCES STUDIENSEMESTER
	( EINSTUFUNG )
	ON DELETE CASCADE;

ALTER TABLE LEHRPLAN
	ADD CONSTRAINT LEHRPLAN_VORLESUNG_PLAN FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_PLAN
	( ID )
	ON DELETE CASCADE;

ALTER TABLE LEHRT
	ADD CONSTRAINT LEHRT_DOZENT FOREIGN KEY
	( PRUEFERNUMMER )
	REFERENCES DOZENT
	( PRUEFERNUMMER )
	ON DELETE CASCADE;

ALTER TABLE LEHRT
	ADD CONSTRAINT LEHRT_VORLESUNG_REAL FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_REAL
	( ID )
	ON DELETE CASCADE;

ALTER TABLE PROFESSOR
	ADD CONSTRAINT PROFESSOR_DOZENT FOREIGN KEY
	( PRUEFERNUMMER )
	REFERENCES DOZENT
	( PRUEFERNUMMER )
	ON DELETE CASCADE;

ALTER TABLE RAUM
	ADD CONSTRAINT RAUM_VORLESUNG_REAL FOREIGN KEY
	( ID )
	REFERENCES VORLESUNG_REAL
	( ID );

ALTER TABLE STUDIENGANG
	ADD CONSTRAINT STUDIENGANG_FAKULTAET FOREIGN KEY
	( KUERZEL )
	REFERENCES FAKULTAET
	( KUERZEL );

ALTER TABLE TAETIGKEIT
	ADD CONSTRAINT TAETIGKEIT_FAKULTAET FOREIGN KEY
	( KUERZEL )
	REFERENCES FAKULTAET
	( KUERZEL );

ALTER TABLE TAETIGKEIT
	ADD CONSTRAINT TAETIGKEIT_DOZENT FOREIGN KEY
	( PRUEFERNUMMER )
	REFERENCES DOZENT
	( PRUEFERNUMMER );

ALTER TABLE VORLESUNG_PLAN
	ADD CONSTRAINT VORLESUNG_PLAN_PROFESSOR FOREIGN KEY
	( PRUEFERNUMMER , ZEITSEMESTER)
	REFERENCES PROFESSOR
	( PRUEFERNUMMER , ZEITSEMESTER);

ALTER TABLE VORLESUNG_PLAN
	ADD CONSTRAINT VORLESUNG_PLAN_STUDIENGANG FOREIGN KEY
	( STUDIENGANG_ID)
	REFERENCES STUDIENGANG
	( ID );

ALTER TABLE VORLESUNG_REAL
	ADD CONSTRAINT VORLESUNG_REAL_TAETIGKEIT FOREIGN KEY
	( ID_TAETIGKEIT )
	REFERENCES TAETIGKEIT
	( ID );
