-- [Kundentabelle erstellen] ----------------------------------------------------------

Create Table tblKunden

(
	[KundenNr] varchar(10) Primary Key,
	[Name]     varchar(50),
	[Vorname]  varchar(50),
	[Ort]      varchar(50),
	[PLZ]      varchar(5)

)
go

-- [Prozedur-Start] ------------------------------------------------------------------

-- Prozedur zur Eweiterung der Kundentabelle
create procedure proc_insert_new_customer
	    @name    varchar(50),
	    @vorname varchar(50),
	    @ort	 varchar(50),
	    @plz     varchar(5)
as

-- Key erstellen
declare @key varchar(10)
set     @key = substring(@name,1,1) + 
		       substring(@vorname,1,1) +
		       substring(@ort,1,1)

-- Key auf Einmaligkeit prüfen / Fortlaufende Nummer anhängen
if exists (select kundennr
           from tblKunden
           where kundennr = @key)
begin
declare @number varchar
set @number = (select count(SUBSTRING(kundennr,1,3))
               from tblKunden
			   where SUBSTRING(kundennr,1,3) = @key)
set @key = @key + '-' + @number
end

-- Datensatz zusammensetzen
insert into tblKunden
values (@key, @name, @vorname, @ort, @plz)

--[Prozedur-Ende]----------------------------------------------------------------------

-- Test Eingabe
execute proc_insert_new_customer Mustermann, Maximus, Zuhause, 66666