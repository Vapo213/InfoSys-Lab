--PLZ 5-stellig
ALTER TABLE ANSCHRIFT
  ADD CONSTRAINT PLZ_Length
  CHECK (length(rtrim(plz)) = 5);
