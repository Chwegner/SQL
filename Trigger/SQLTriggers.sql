create table tblTriggerProdukteVKs
(
	[ID] int identity(1,1) primary key,
	[Bezeichnung] varchar(50),
	[Anwender] varchar(50),
	[Datum] datetime,
	[AlterVK] decimal(10,2),
	[NeuerNK] decimal(10,2)	
)

go

create trigger TR_VK_UPDATE
	on dbo.tblProdukte
	after update
as
begin
	set nocount on;
	
	if update(VKPreis)
	   insert into tblTriggerProdukteVKs
	(Bezeichnung,Anwender,Datum,AlterVK,NeuerNK)
   SELECT i.ProduktName,
      SYSTEM_USER,GETDATE(),
      d.VKPreis,
      i.VKPreis
   FROM INSERTED i inner join 
        DELETED d on i.ProduktID = d.ProduktID
end

Update tblprodukte set VKPreis = 44
		where ProduktID = 3
