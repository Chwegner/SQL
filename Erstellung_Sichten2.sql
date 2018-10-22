
--Aufgabe 1
create view Liste as
select top 1000 [CategoryName], [ProductName]
from Categories cat
inner join Products pro
on cat.CategoryID = pro.CategoryID
order by 1

--Aufgabe 2
create view Aktive_Produkte as
select top 1000 [ProductName]
from [dbo].[Products]
where [Discontinued] = 0

--Aufgabe 3
create view Prod_Durchschnitt as
SELECT ProductName, UnitPrice 
FROM Products  
WHERE (SELECT AVG(UnitPrice)FROM Products) < UnitPrice
order by unitprice desc

--Aufgabe 4
create view Luxus as
select top 10 [ProductName], [UnitPrice]
from [dbo].[Products]
order by [UnitPrice] desc