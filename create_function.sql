-- Aufgabe 1: 
-- Zu einem Film soll der Regisseur ausgegeben werden.

create function fn_regisseur
(
	@film varchar(50)
)
returns table
as
return
(
	select mov_person.name
	from mov_person, mov_film
	where mov_film.regie = mov_person.id
	and mov_film.titel = @film
)

go

select * from fn_regisseur('Braveheart')

go

-- Aufgabe 2:
-- Zu einem Namen, falls diese Person je Regie geführt hat, sollen die
-- die entsprechenden Filme ausgegeben werden, bei denen die Person
-- Regie geführt hat.

create function fn_filme
(
	@person varchar(50)
)
returns table
as
return
(
	select mov_film.titel
	from mov_film, mov_person
	where mov_film.regie = mov_person.id
	and mov_person.name = @person
)

go

select * from fn_filme('Woody Allen')

go

-- Aufgabe 3:
-- Zu einem Film soll die Liste der Schauspieler ausgegeben
-- werden, die in diesem Film mitgespielt haben.

create function fn_actorlist
(
	@titel varchar(50)
)
returns table
as
return
(
	select mov_person.name
	from mov_person, mov_film, mov_besetzung
	where mov_film.id = mov_besetzung.filmid
	and mov_besetzung.persid = mov_person.id
	and mov_film.titel = @titel
)

go

select * from fn_actorlist('Braveheart')

go

-- Aufgabe 4:
-- Zu einem Schauspieler/einer Schauspielerin soll die Liste
-- seiner/ihrer Filme ausgegeben werden.

create function fn_filmography
(
	@actor varchar(50)
)
returns table
as
return
(
	select mov_film.jahr, mov_film.titel
	from mov_film, mov_besetzung, mov_person
	where mov_film.id = mov_besetzung.filmid
	and mov_besetzung.persid = mov_person.id
	and mov_person.name = @actor
)

go

select * from fn_filmography('Mel Gibson')


