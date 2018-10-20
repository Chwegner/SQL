
use TeachSQL


--Aufgabe 1:

select eventdesc, CONVERT (varchar, eventdate, 104) 'datum'
from [dbo].[tblDateTimeFun]
order by eventdate desc

--Aufgabe 2:

select eventdesc, datename(weekday, eventdate) 'Wochentag'
from [dbo].[tblDateTimeFun]
order by Datepart(weekday, eventdate)

--Aufgabe 3:

select eventdesc 'Events mit bekanntem Datum', eventdate 'Datum'
from [dbo].[tblDateTimeFun]
where CONVERT(varchar,eventdate,114) != '00:00:00:000'
order by DATEPART(year, eventdate)

--Aufgabe 4:

select eventdesc, eventdate
from [dbo].[tblDateTimeFun]
where DATEPART(weekday, eventdate) in (6,7)

--Aufgabe 5:

select eventdesc, datename(year, eventdate) 'Jahr'
from [dbo].[tblDateTimeFun]
where eventdesc Like '%Tolkien%'

--Aufgabe 6:

select eventdesc, datediff(day, eventdate, getdate()) 'Tage seit UNIX Time'
from [dbo].[tblDateTimeFun]
where eventdesc like '%UNIX%'

--Aufgabe 7:
select eventdesc, CONVERT(VARCHAR,eventdate,108)
from [dbo].[tblDateTimeFun]
where eventdesc like '%Star Trek%'

--Aufgabe 8:

select eventdesc, datediff(year, eventdate, getdate()) 'Alter'
from [dbo].[tblDateTimeFun]
where eventdesc like '%Jeremy Clarkson%' and eventdesc like '%born%'

--Aufgabe 9:

select eventdesc, DATEPART(year,eventdate) + 80 'James May wird 80'
from [dbo].[tblDateTimeFun]
where eventdesc like '%James May%' 

--Aufgabe 10:

select eventdesc, DATEDIFF(year,GETDATE(),eventdate) 'Jahre bis Warp'
from [dbo].[tblDateTimeFun]
where eventdesc like '%Warp%'

--Aufgabe 11:

select eventdesc, DATEDIFF(day,GETDATE(),eventdate) 'Tage bis Exitus'
from [dbo].[tblDateTimeFun]
where eventdesc like '%kill%'
