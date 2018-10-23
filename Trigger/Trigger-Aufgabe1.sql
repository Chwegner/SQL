USE master
GO

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'TriggerTrouble'
)
DROP DATABASE TriggerTrouble
GO

CREATE DATABASE TriggerTrouble
GO

USE [TriggerTrouble]
CREATE TABLE [dbo].[tblKontakte](
	[EMail] [varchar](255) NOT NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Nachname] [varchar](50) NOT NULL,
	[Telefon] [varchar](20) NOT NULL,
	[Fax] [varchar](20) NULL,
	[Mobil] [varchar](20) NULL,
 CONSTRAINT [PK_tblKontakte] PRIMARY KEY CLUSTERED 
(
	[EMail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into [tblKontakte] 
	values ('A.Merkel@bundestag.de','Angela','Merkel','010-111111','010-111112','0160-211111')
insert into [tblKontakte] 
	values ('G.Schröder@bundestag.de','Gerhard','Schröder','010-111121','010-111122','0160-311111')
insert into [tblKontakte] 
	values ('H.Kohl@bundestag.de','Helmut','Kohl','010-111131','010-111132','0160-311111')

GO 

CREATE TRIGGER 
	TR_KONTAKTE
  ON 
		tblKontakte
   AFTER 
		INSERT , DELETE , UPDATE
AS 
BEGIN
	PRINT 'Keine Änderungen solange ich im Urlaub bin!'
	ROLLBACK
END
GO


CREATE TABLE [dbo].[tblProdukte](
	[ProduktID] [int] NOT NULL,
	[ProduktName] [varchar](50) NOT NULL,
	[VKPreis] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_tblProdukte] PRIMARY KEY CLUSTERED 
(
	[ProduktID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [tblProdukte]
           ([ProduktID]
           ,[ProduktName]
           ,[VKPreis])
     VALUES
           (1
           ,'Tennisbälle (5)'
           ,5.2)

INSERT INTO [tblProdukte]
           ([ProduktID]
           ,[ProduktName]
           ,[VKPreis])
     VALUES
           (2
           ,'Fussball'
           ,30.99)

INSERT INTO [tblProdukte]
           ([ProduktID]
           ,[ProduktName]
           ,[VKPreis])
     VALUES
           (3
           ,'Handball'
           ,20.99)

INSERT INTO [tblProdukte]
           ([ProduktID]
           ,[ProduktName]
           ,[VKPreis])
     VALUES
           (4
           ,'Laufschuhe'
           ,120.99)

GO

