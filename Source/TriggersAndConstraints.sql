--PLZ 5-stellig
ALTER TABLE ANSCHRIFT
  ADD CONSTRAINT PLZ_Length
  CHECK (length(rtrim(plz)) = 5);

-- DWS bei TAETIGKEIT Update
CREATE TRIGGER DWS_Update
  AFTER INSERT ON TAETIGKEIT
  REFERENCING NEW AS n
  FOR EACH ROW MODE DB2SQL
    UPDATE PROFESSOR
    SET DWS = DWS + n.DWS
    WHERE n.PRUEFERNUMMER = PRUEFERNUMMER
;