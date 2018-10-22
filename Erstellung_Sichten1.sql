--Aufgabe 1
create view Mitarbeiter as
select [name], [abt_name]
from [dbo].[abt] abt
inner join [dbo].[ang] ang
on abt.abt_nr = ang.abt_nr
order by 1

--Aufgabe 2
create view Leiter as
select [abt_name], [name]
from [dbo].[abt], [dbo].[ang]
where abt.abt_leiter = ang.a_nr

--Aufgabe 3
create view Mang as
select  [abt_name]
from [dbo].[abt], [dbo].[ang]
where ang.name like '%Mang%' and abt.abt_nr = ang.abt_nr

--Aufgabe 4
create view Prozente as
select distinct [p_name]
from [dbo].[ang], [dbo].[pro], [dbo].[pro_ang]
where ang.a_nr = pro_ang.a_nr
and pro_ang.p_nr = pro.p_nr
and [proz_arb] > 50

--Aufgabe 5
create view P5 as
select abt.[abt_name], ang.[name]
from [dbo].[abt], [dbo].[ang], [dbo].[pro]
where pro.p_leiter = ang.a_nr
and abt.abt_nr = ang.abt_nr
and p_name = 'P5'

--Aufgabe 6
create view Sechs as
select [abt_name], [name]
from [dbo].[pro_ang], [dbo].[abt], [dbo].[ang], [dbo].[pro]
where abt.abt_nr = ang.abt_nr
and ang.a_nr = pro_ang.a_nr
and pro_ang.p_nr = pro.p_nr
and p_name = 'P3'

--Aufgabe 7
create view Sieben as
select distinct [beruf]
from [dbo].[abt], [dbo].[ang]
where abt.abt_nr = ang.abt_nr
and abt_name = 'Entwicklung'

--Aufgabe 8
create view Acht as
select distinct [beruf]
from [dbo].[abt], [dbo].[ang]
where abt.abt_leiter = ang.a_nr

--Aufgabe 9
create view Neun as
select V.name
from [dbo].[ang] A, [dbo].[ang] V
where A.name = 'Seel'
and A.vorg = V.a_nr

