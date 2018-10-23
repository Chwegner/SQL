IF OBJECT_ID('tblBestellung') IS NOT NULL
	DROP TABLE tblBestellung
GO
CREATE TABLE tblBestellung 
(
	[BestNR]		INT PRIMARY KEY,
	[Datum]			DATETIME DEFAULT GETDATE(),
	[Summe]			DECIMAL(10,2) DEFAULT 0.0
)
IF OBJECT_ID('tblBestellDetails') IS NOT NULL
	DROP TABLE tblBestellDetails
GO
CREATE TABLE tblBestellDetails 
(
	[BestNR]		INT,
	[Pos]			INT,
	[Artikel]		VARCHAR(40),
	[VKPreis]		DECIMAL(8,2),
	[Menge]			INT
)
GO
INSERT INTO tblBestellung ([BestNr]) VALUES (1)
INSERT INTO tblBestellung ([BestNr]) VALUES (2)
GO
SELECT * FROM tblBestellung
GO
IF OBJECT_ID('TR_INSERT') IS NOT NULL
	DROP TRIGGER TR_INSERT
GO
CREATE TRIGGER TR_INSERT ON tblBestellDetails
AFTER INSERT
AS
BEGIN

	UPDATE 	tblBestellung
	SET [Summe] = [Summe] + ([VKPreis] * [Menge])
	FROM INSERTED
	WHERE tblBestellung.BestNR = INSERTED.BestNR

END
GO
IF OBJECT_ID('TR_UPDATE') IS NOT NULL
	DROP TRIGGER TR_UPDATE
GO
CREATE TRIGGER TR_UPDATE ON tblBestellDetails
AFTER UPDATE
AS
BEGIN

	IF UPDATE([VKPreis]) OR UPDATE([Menge])
	BEGIN
		UPDATE 	tblBestellung
	SET [Summe] = [Summe] - ([VKPreis] * [Menge])
	FROM DELETED
	WHERE tblBestellung.BestNR = DELETED.BestNR

	UPDATE 	tblBestellung
	SET [Summe] = [Summe] + ([VKPreis] * [Menge])
	FROM INSERTED
	WHERE tblBestellung.BestNR = INSERTED.BestNR	

	END
END
GO
IF OBJECT_ID('TR_DELETE') IS NOT NULL
	DROP TRIGGER TR_DELETE
GO
CREATE TRIGGER TR_DELETE ON tblBestellDetails
AFTER DELETE
AS
BEGIN

	UPDATE 	tblBestellung
	SET [Summe] = [Summe] - ([VKPreis] * [Menge])
	FROM DELETED
	WHERE tblBestellung.BestNR = DELETED.BestNR

END
GO

SELECT * FROM tblBestellung

GO
INSERT INTO tblBestellDetails 
VALUES (1,1,'Ball',10,2)
INSERT INTO tblBestellDetails 
VALUES (1,2,'Buch',20,1)
INSERT INTO tblBestellDetails 
VALUES (2,1,'Hemd',40,3)
INSERT INTO tblBestellDetails 
VALUES (2,2,'Hose',50,3)
GO
SELECT * FROM tblBestellung
GO
UPDATE tblBestellDetails
SET Menge = 4, VKPREIS = 40 WHERE BestNr = 2 AND POS = 2
GO
SELECT * FROM tblBestellung
GO
DELETE FROM tblBestellDetails
WHERE BestNr = 2 AND POS = 2
GO
SELECT * FROM tblBestellung