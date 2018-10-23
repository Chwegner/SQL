IF OBJECT_ID('tblTriggerOpfer') IS NOT NULL
	DROP TABLE tblTriggerOpfer
GO
CREATE TABLE tblTriggerOpfer 
(
	ID		INT IDENTITY(1,1) PRIMARY KEY,
	[Name]	VARCHAR(50),
	Vorname	VARCHAR(50)
)
GO
IF OBJECT_ID('tblTriggerOpferHistory') IS NOT NULL
	DROP TABLE tblTriggerOpferHistory
GO
CREATE TABLE tblTriggerOpferHistory 
(
	ID		INT PRIMARY KEY,
	[Name]	VARCHAR(50),
	Vorname	VARCHAR(50),
	[LoeschDatum]	DATETIME,
	[GeloeschtVon]	VARCHAR(50)
)
GO
INSERT INTO tblTriggerOpfer 
([Name],Vorname) VALUES ('Kohl','Helmut')
INSERT INTO tblTriggerOpfer 
([Name],Vorname) VALUES ('Merkel','Angela')
INSERT INTO tblTriggerOpfer 
([Name],Vorname) VALUES ('Schröder','Gerd')
GO
SELECT * FROM tblTriggerOpfer
GO
ALTER TRIGGER TR_LOG_DELETE ON tblTriggerOpfer
AFTER	DELETE
AS
BEGIN
SET NOCOUNT ON
	-- Alle gelöschten Datensätze in die
	-- Protokolltabelle schreiben
	INSERT INTO tblTriggerOpferHistory
	SELECT *,GETDATE(),CURRENT_USER FROM DELETED
END
SELECT * FROM tblTriggerOpfer
SELECT * FROM tblTriggerOpferHistory
GO
DELETE FROM tblTriggerOpfer
WHERE ID = 2
GO
SELECT * FROM tblTriggerOpfer
SELECT * FROM tblTriggerOpferHistory