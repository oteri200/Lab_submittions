-- Review the tables in the database.
USE sakila;

-- Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from actor;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from films_2020;
select * from incative_user;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;


-- Select one column from a table. Get film titles.
select * from  film ;
select title from film;

-- Select one column from a table and alias it. Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, 
#but this is a good time to think about how you might get that information in the future.

select title as "movie name" from film;
select distinct(name) from language;


-- Using the select statements and reviewing how many records are returned, 
#can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
select distinct staff_id, store_id from staff;
select first_name from staff;




