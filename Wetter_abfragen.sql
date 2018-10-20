--Aufgabe 1:

SELECT YEAR, Rain, Month
from [dbo].[OxfordWeather]
where year >= 2000 and MaxTempC >= 23
order by rain desc

--Aufgabe 2:

select year
from [dbo].[OxfordWeather]
where month = 12 and FrostyDays > 0 and Rain > 0

--Aufgabe 3:
select year, month
from [dbo].[OxfordWeather]
where rain >= 2

--Aufgabe 4:
select year, frostydays
from [dbo].[OxfordWeather]
where month in (4,5) and year between 1900 and 1950
order by FrostyDays desc

--Aufgabe 5:
select year, month
from [dbo].[OxfordWeather]
where SunHours is NULL

--Aufgabe 6:
select year, month, MaxTempC
from [dbo].[OxfordWeather]
where Rain > 100 and FrostyDays = 0 and year between 1970 and 1979
order by MaxTempC desc

--Aufgabe 7:
select month, sunhours
from [dbo].[OxfordWeather]
where month in (6,7,8) and year = 1990

--Aufgabe 8:
select month, frostydays
from [dbo].[OxfordWeather]
where year = 2000

--Aufgabe 9:
select year, month
from [dbo].[OxfordWeather]
where month in (9,10,11) and year between 1800 and 1899 and FrostyDays = 1

--Aufgabe 10:
select top 1 year
from [dbo].[OxfordWeather]
where SunHours is not NULL
order by SunHours asc

--Aufgabe 11:





