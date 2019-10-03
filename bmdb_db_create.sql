drop database if exists bmdb;
create database bmdb;
use bmdb;

create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null,
	rating 			varchar(5) 	    not null,
	year 			int 	        not null,
	director        varchar(50)     not null
);

Insert into movie (title, rating, year, director)
	values ('Spaceballs', 'PG', 1987, 'Mel Brooks');
Insert into movie (title, rating, year, director)
	values ('Blazzing Saddles', 'R', 1974, 'Mel Brooks');
Insert into movie (title, rating, year, director)
	values ('Scrooged', 'PG-13', 1988, 'Richard Donner');



create table actor (
	id 				int 			not null primary key auto_increment,
	firstName 		varchar(25) 	not null,
	lastName		varchar(25) 	not null,
	gender 			varchar(6) 	    not null,
    birthDate       date			not null
);

-- Date format YYYY-MM-DD

Insert into actor (firstName, lastName, gender, birthDate)
	values ('Mel', 'Brooks', 'M', '1926-06-28');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Gene', 'Wilder', 'M', '1933-06-11');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Bill', 'Murray', 'M', '1950-09-21');

create table Credit (
	id 				int 			not null primary key auto_increment,
	movieID 		int 			not null,
	actorID		    int 			not null,
	role 			varchar(35) 	not null,
	    foreign key (movieID) references movie(id),
        foreign key (actorID) references actor(id)
);

Insert into Credit (movieID, actorID, role)
	values (1, 1, 'President Skroob / Yogurt');
Insert into Credit (movieID, actorID, role)
	values (2, 2, 'Jim');
Insert into Credit (movieID, actorID, role)
	values (3, 3, 'Frank Cross');
Insert into Credit (movieID, actorID, role)
	values (2, 1, 'Governor Lepetomane / Indian Chief');

select * from movie;
select * from actor;
select * from credit;
select * from actor
	where birthDate < '1982-05-03';
select * from movie
	where title = 'Spaceballs';
-- 3 table join
select m.title, a.firstname, c.role
  from movie m
  join actor a
    on m.title = a.firstname
  join credit c
    on a.firstName = c.role