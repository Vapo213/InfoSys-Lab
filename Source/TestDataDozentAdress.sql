-- Anschriften der Dozenten
INSERT INTO ANSCHRIFT
(ID, STRASSE, HAUSNUMMER, PLZ, ORT)
VALUES
(1, 'dummy','1', 11111, 'Dummy'),
(2, 'Flandernstrasse','2',73732,'Esslingen'),
(3, 'Flandernstrasse','3',73732,'Esslingen'),
(4, 'Flandernstrasse','4',73732,'Esslingen'),
(5, 'Flandernstrasse','5',73732,'Esslingen'),
(6, 'Flandernstrasse','6',73732,'Esslingen'),
(7, 'Flandernstrasse','7',73732,'Esslingen'),
(8, 'Flandernstrasse','8',73732,'Esslingen'),
(9, 'Flandernstrasse','9',73732,'Esslingen'),
(10, 'Flandernstrasse','10',73732,'Esslingen'),
(11, 'Flandernstrasse','11',73732,'Esslingen'),
(12, 'Flandernstrasse','12',73732,'Esslingen'),
(13, 'Flandernstrasse','13',73732,'Esslingen'),
(14, 'Lenzhalde','1A',73732,'Esslingen'),
(15, 'Lenzhalde','1B',73732,'Esslingen'),
(16, 'Cannstatter Strasse','4',70173,'Stuttgart'),
(17, 'Cannstatter Strasse','5',70173,'Stuttgart'),
(18, 'Cannstatter Strasse','6',70173,'Stuttgart'),
(19, 'Cannstatter Strasse','7',70173,'Stuttgart'),
(20, 'Cannstatter Strasse','900',70190,'Stuttgart'),
(21, 'Cannstatter Strasse','901',70190,'Stuttgart'),
(22, 'Cannstatter Strasse','902',70190,'Stuttgart'),
(23, 'Cannstatter Strasse','903',70190,'Stuttgart'),
(24, 'Cannstatter Strasse','904',70190,'Stuttgart'),
(25, 'Cannstatter Strasse','905',70190,'Stuttgart'),
(26, 'Cannstatter Strasse','906',70190,'Stuttgart'),
(27, 'Cannstatter Strasse','907',70190,'Stuttgart'),
(28, 'Cannstatter Strasse','908',70190,'Stuttgart'),
(29, 'Cannstatter Strasse','909',70190,'Stuttgart'),
(30, 'Cannstatter Strasse','910',70190,'Stuttgart'),
(31, 'Bachstrasse','15',73730,'Esslingen'),
(32, 'Mercedesstrasse','7',70372,'Stuttgart'),
(33, 'Mercedesstrasse','8',70372,'Stuttgart'),
(34, 'Mercedesstrasse','9',70372,'Stuttgart'),
(35, 'Flandernstrasse','1',73732,'Esslingen');

--Fakultäten
INSERT INTO FAKULTAET
(NAME, KUERZEL)
VALUES
('Informatik', 'IT'),
('Studium Generale', 'GS'),
('Keine Fakultaet', '-'),
('Grundlagen', 'G');

--Dozenten
INSERT INTO DOZENT
(NACHNAME, PRUEFERNUMMER, KUERZEL, TITEL, PRIVATMAIL, HSMAIL, TELEFONNUMMER, ADRESSID)
VALUES
('Berg',3051,'IT','LB',NULL,NULL,NULL,35),
('Brill',1633,'IT','LB',NULL,NULL,NULL,2),
('Buehler',494,'IT','LB',NULL,NULL,NULL,3),
('Erkert',2928,'IT','LB',NULL,NULL,NULL,4),
('Gruebel',555,'IT','LB',NULL,NULL,NULL,5),
('Guessmann',1563,'IT','LB',NULL,NULL,NULL,6),
('Haag',558,'IT','LB',NULL,NULL,NULL,7),
('Hanna',2877,'IT','LB',NULL,NULL,NULL,8),
('Hausser',568,'IT','LB',NULL,NULL,NULL,9),
('Hehl',571,'IT','LB',NULL,NULL,NULL,10),
('Hiller',1757,'IT','LB',NULL,NULL,NULL,11),
('Kaehler',803,'IT','LB',NULL,NULL,NULL,12),
('Kaltenhaeuser',1843,'IT','LB',NULL,NULL,NULL,13),
('Klenk',604,'IT','LB',NULL,NULL,NULL,14),
('Krauss',2379,'IT','LB',NULL,NULL,NULL,15),
('Linsenmaier',2893,'IT','LB',NULL,NULL,NULL,30),
('Mahood',3116,'IT','LB',NULL,NULL,NULL,31),
('Metz',2370,'IT','LB',NULL,NULL,NULL,16),
('Mueller',642,'IT','LB',NULL,NULL,NULL,17),
('Mueller-Hofmann',643,'IT','LB',NULL,NULL,NULL,18),
('Rauschnabel',669,'IT','LB',NULL,NULL,NULL,19),
('Reber',144,'IT','LB',NULL,NULL,NULL,20),
('Redmers',671,'IT','LB',NULL,NULL,NULL,21),
('Sari',2355,'IT','LB',NULL,NULL,NULL,22),
('Schliess',695,'IT','LB',NULL,NULL,NULL,23),
('Schmid',2372,'IT','LB',NULL,NULL,NULL,24),
('Schoenherr',2927,'IT','LB',NULL,NULL,NULL,25),
('Schulz',704,'IT','LB',NULL,NULL,NULL,26),
('Schulz',1652,'IT','LB',NULL,NULL,NULL,27),
('Seiffert',2808,'IT','LB',NULL,NULL,NULL,28),
('Stedile',1540,'IT','LB',NULL,NULL,NULL,29),
('Strecker',2371,'IT','LB',NULL,NULL,NULL,30),
('Warendorf',1018,'IT','LB',NULL,NULL,NULL,30),
('Beck',939,'IT','P',NULL,NULL,NULL,1),
('Coenning',1495,'G','P',NULL,NULL,NULL,1),
('Dausmann',264,'IT','P',NULL,NULL,NULL,1),
('Doster',267,'IT','P',NULL,NULL,NULL,1),
('Erath',941,'IT','P',NULL,NULL,NULL,1),
('Feil',1057,'IT','P',NULL,NULL,NULL,1),
('Friedrich',442,'IT','P',NULL,NULL,NULL,1),
('Gaukel',1000,'G','P',NULL,NULL,NULL,1),
('Goll',282,'IT','P',NULL,NULL,NULL,1),
('Groos',2921,'G','P',NULL,NULL,NULL,1),
('Guendner',287,'IT','P',NULL,NULL,NULL,1),
('Hoefer',297,'IT','P',NULL,NULL,NULL,1),
('Kappen',305,'IT','P',NULL,NULL,Null,33),
('Keller',411,'IT','P',NULL,NULL,NULL,1),
('Koch',313,'G','P',NULL,NULL,NULL,1),
('Kull',319,'IT','P',NULL,NULL,NULL,1),
('Lindermeir',421,'IT','P',NULL,NULL,NULL,1),
('Malz',329,'IT','P',NULL,NULL,NULL,1),
('Marchthaler',1105,'IT','P',NULL,NULL,NULL,1),
('Martin',331,'G','P',NULL,NULL,NULL,34),
('Melcher',337,'IT','P',NULL,NULL,NULL,1),
('Melzer',1498,'G','P',NULL,NULL,NULL,1),
('Nonnast',342,'IT','P',NULL,NULL,NULL,1),
('Reiser',2631,'IT','P',NULL,NULL,NULL,1),
('Roessler',1672,'IT','P',NULL,NULL,NULL,1),
('Schmidt',361,'IT','P',NULL,NULL,NULL,1),
('Schoop',1035,'GS','LB',NULL,NULL,NULL,32),
('Sigg',951,'G','P',NULL,NULL,NULL,1),
('Strobel',371,'G','P',NULL,NULL,NULL,1),
('Ulmet',376,'G','P',NULL,NULL,NULL,1),
('Vaeterlein',784,'IT','P',NULL,NULL,NULL,1),
('Warendorf',435,'IT','P',NULL,NULL,NULL,1),
('Weber',381,'IT','P',NULL,NULL,NULL,1),
('Wiese',385,'IT','P',NULL,NULL,NULL,1),
('Zieher',391,'IT','P',NULL,NULL,NULL,1),
('Zimmermann',392,'IT','P',NULL,NULL,NULL,1);

--LEHRBEAUFTRAGTE
-- ZEITFENSTER integer NOT NULL
-- PRUEFERNUMMER integer NOT NULL
INSERT INTO LEHRBEAUFTRAGTER
(PRUEFERNUMMER, )
VALUES
()

--PROFESSOREN
--	DWS smallint NOT NULL
--	VORLESUNGSKONTIGENT integer NOT NULL
--	ZEITSEMESTER char(6) NOT NULL
--	PRUEFERNUMMER integer NOT NULL
INSERT INTO PROFESSOR
(PRUEFERNUMMER, )
VALUES
(),
