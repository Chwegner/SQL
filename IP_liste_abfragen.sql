select *
from [dbo].[tblDHCPLog]

--Aufgabe 1:

select count([IP]) 'IPs insgesamt'
from [dbo].[tblDHCPLog]

--Aufgabe 2:

select count(distinct [SRCMAC]) 'Anzahl Rechner'
from [dbo].[tblDHCPLog]

--Aufgabe 3:

select count(distinct [IP]) 'Anzahl IP-Adressen'
from [dbo].[tblDHCPLog]

--Aufgabe 4:

select distinct[SRCMAC], count([IP]) 'Anzahl IPs'
from [dbo].[tblDHCPLog]
group by [SRCMAC]

--Aufgabe 5:

select distinct [IP], count(distinct[SRCMAC]) 'Anzahl Rechner'
from [dbo].[tblDHCPLog]
group by [IP]
order by 2 desc

--Aufgabe 6:

select distinct [IP], count(distinct[SRCMAC]) as Rechner
from [dbo].[tblDHCPLog]
group by [IP]
having count(distinct[SRCMAC]) = 16

--Aufgabe 7:

select distinct LeaseTime, count(IP) 'Anzahl IPs'
from [dbo].[tblDHCPLog]
group by LeaseTime
order by 2

--Aufgabe 8:
select distinct IP, min(LeaseDate) 'Erste Vergabe', max(LeaseDate) 'Letzte Vergabe'
from [dbo].[tblDHCPLog]
group by IP
order by 2

--Aufgabe 9:

select distinct datepart(month, [LeaseDate]) Monat, count([IP]) 'Anzahl IPs'
from [dbo].[tblDHCPLog]
group by datepart(month, [LeaseDate])
order by 1

--Aufgabe 10:

select distinct datepart(weekday,[LeaseDate]) 'Wochentag', count([IP]) 'Anzahl IPs'
from [dbo].[tblDHCPLog]
group by datepart(weekday,[LeaseDate])
order by 1