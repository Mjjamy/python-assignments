create database pw;
use pw;
CREATE TABLE courses 
(Course_Id char(10),
Course_Name varchar(30),
Mode_Of_Delivery varchar(10),
Students_Intake int,
Faculty varchar(30));
##DDL Commands
#Create

CREATE TABLE courses 
(Course_Id char(10),
Course_Name varchar(30),
Mode_Of_Delivery varchar(10),
Students_Intake int,
Faculty varchar(30));

#Drop 
drop table courses;

CREATE TABLE courses 
(Course_Id char(10),
Course_Name varchar(30),
Mode_Of_Delivery varchar(10),
Students_Intake int,
Faculty varchar(30));

#Alter
alter table courses Change column mode_of_delivery Delivery_Mode varchar(10);
alter table courses Change column faculty Faculty varchar(25);

select * from courses ;

Alter table courses add column Location varchar(20);


select* from courses;

alter table  courses drop column Location;
select* from courses;

#Rename
alter table courses rename to pw_courses;

select* from pw_courses;

CREATE TABLE employees (
    emp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    email TEXT NOT NULL,
    salary DECIMAL(10, 2) DEFAULT 30000.00,
    UNIQUE (email(255))
     );
     select* from employees; 
     
	CREATE TABLE courses 
(Course_Id char(10) unique,
Course_Name varchar(30) not null,
Delivery_Mode varchar(15) default("Live Sessions"),
Students_Intake int check(Students_Intake>=90),
Faculty varchar(30));

select* from courses;

insert into courses 
values ("GN1001","Generative AI 101","Live",90,"Piyush");

select* from courses;

insert into courses 
values ("GN1005","Generative AI 102","Live",120,"Saurabh"),("ML1005","Machine Learning RECAP","Live",120,"Sarthak"),
("DS1002","Data Science","Hybrid",90,"Priya");

select* from courses;

insert into courses (Course_Id,Course_Name,Delivery_Mode)
values("DA1002","FULL STACK DATA ANALLYTICS","Live");
select* from courses;

insert into courses (Course_Id,Course_Name,Faculty)
values("DA1005","FULL STACK DATA ANALYTICS","Sagar");
select* from courses;

update courses
set Delivery_Mode ="Hybrid"
where course_id="GN1005";

select* from courses;

use world;
select* from city;

select* from country;
select* from countrylanguage;

select Name,Continent,Region,
SurfaceArea,Population,
LifeExpectancy,GNP
from country;

select Name,Continent,
SurfaceArea,Population, round(Population/SurfaceArea,0) as Pop_density,
round(GNP*1000000/Population,0) as GNP_Per_Capita
from country
order by Pop_density desc;

##Limit and Offset

##limiting the data to top n.
select Name,Continent,
SurfaceArea,Population, round(Population/SurfaceArea,0) as Pop_density
from country
order by Pop_density desc
limit 15;

##Country with highest per capita income
select Name, Continent, Population,GNP,
round(GNP*1000000/Population,0) as per_capita_inc
from country
order by per_capita_inc desc
limit 5 ;

##Display the data of countries within ranks 11 to 15 as per_cap_inc
select Name, Continent, Population,GNP,
round(GNP*1000000/Population,0) as per_capita_inc
from country
order by per_capita_inc desc
limit 1
offset 112 
;

use world;
select* from city;
select* from country;
select* from countrylang; 

##Display the data in an order

select* from country;

select name,continent,surfacearea,population,lifeexpectancy
from country
order by population desc;

select name,continent,surfacearea,population,lifeexpectancy,
round(population/surfacearea,2) as pop_density
from country
order by pop_density desc;

select name,region,surfacearea,population,lifeexpectancy,
round(population/surfacearea,2) as pop_density
from country
order by region desc,pop_density desc;

##filtering of data
##where,having

select* from city
where population>500000;

select* from city
where population>=500000;

select* from city
where population=500000;

select * from country;

select name,continent,lifeexpectancy as le
from country
where lifeexpectancy<=70
order by le desc;

select name,continent,lifeexpectancy as le
from country
where lifeexpectancy <>70;

select * from country;

select name,continent,indepyear from country
where name>"India"
order by name ;

##logical operators and/or
select name,continent,indepyear,surfacearea,population,lifeexpectancy,gnp from country
where continent="Asia";

##display the data of all asian countries where population>10mn
select name,continent,indepyear,surfacearea,population,lifeexpectancy,gnp from country
where continent="Asia" or population>10000000; 

##display the data of all countries of continents asia,europe,africa
select name,continent,indepyear,
surfacearea,population,lifeexpectancy,gnp 
from country
where continent="Asia" or continent="Europe" or continent="Africa"
order by continent;

##in operator is useful in multiple conditions on the same column
select*from country
where continent in("Asia","Africa","Europe");

##between operator to select certain values of variable in dictionary order 
select name,continent,lifeexpectancy 
 from country
where lifeexpectancy between 40 and 60
order by lifeexpectancy;

select * from country
where name between "China" and "Iran"
order by name;

use sakila;
select * from film
where  title like "A%"; ## % means any no. of characters

select * from film
where  title not like "%A%";
 
 select* from film
 where special_features like "%Deleted Scenes%";
 
 select * from film
 where description not like "%Drama%";
 
 select* from film
 where title like "_____a"; ##underscore indicates fixed no of characters
 
 select* from actor
 where first_name like "%____e";
 
  select* from actor
 where first_name like "____e%";
 
 use world;
 select* from country;
 
 select round(avg(population)/1000000,2) as avg_population_mn from country;
 
 select round(sum(population)/1000000,2) as tot_population_mn,
 round(avg(LifeExpectancy),2) as ALE,
 round(avg(GNP)/1000,2) as Avg_gnp,
 round(sum(surfacearea)/1000000,2) as TSA
 from country;
 
 select
 count(distinct continent) as no_of_continents,
 count(name) as no_of_countries
 from country;
 
use world;

select*from country;
select round(sum(population)/1000000,2) as tot_population_mn,
 round(avg(LifeExpectancy),2) as ALE,
 round(avg(GNP)/1000,2) as Avg_gnp,
 round(sum(surfacearea)/1000000,2) as TSA
 from country;
 
 select count(name),count(distinct name) from country;
 
 ###Group by
 select
 continent,   
 round(sum(population)/1000000,2) as tot_cont_population_mn,
 round(avg(LifeExpectancy),2) as ALE,
 round(avg(GNP)/1000,2) as Avg_gnp_000s,
 round(sum(surfacearea)/1000000,2) as TSA_mn
 from country
 group by continent
 having TSA_mn>25;
 
 ### Continent wise pop density and GNP per Capita
 select
 name,
 round(population/surfacearea,2) as pop_density,
 round(GNP*1000000/population,2) as GNP_per_capita
 from country;
 
 ###String Functions
 #concat
 #replace
 #left/right
 #upper/lower
 #substring
 #Trim/Ltrim/Rtrim
 #Reverse
 #length
 use sakila;
 #concat
 select* from actor;
 select actor_id,first_name,last_name,concat(first_name," ",last_name) as full_name from actor; 
 
 #upper/lower
 select actor_id,lower(first_name) as lfn, lower(last_name) as uln from actor;
 
 #replace
 select replace("Hello world","world","SQL") as new_o;
 
 #left/right
 select * from address;
 select city_id,district,upper(left(district,3)) New_dis,upper(right(district,3)) Right_dis from address;
 
#substring
select* from customer;
select first_name ,last_name,email,substring(email,4,5) subs from customer; 

#trim/ltrim/rtrim
select district,trim(concat("   ",district,"   ")) new_dis from address;

#reverse
#length

select first_name, email,length(email) lemail from customer
order by lemail desc;

 









