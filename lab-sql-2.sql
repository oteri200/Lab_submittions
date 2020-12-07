use sakila;
-- Select all the actors with the first name ‘Scarlett’.
select * from actor where first_name ="scarlett";

-- Select all the actors with the last name ‘Johansson’.
select * from actor where last_name = "johansson";
-- How many films (movies) are available for rent?
select count(inventory_id) from inventory;

-- How many films have been rented?
select count(rental_id) from rental;

-- What is the shortest and longest rental period?
select max(rental_duration) as max_duration, min(rental_duration) as min_duration
from sakila.film;



-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select * from film order by length desc limit 10;
select * from film order by length asc limit 1;
select max(length),min(length) from film;




-- What's the average movie duration?
select avg(length) from film;

-- What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length) / 60) as hours, round(avg(length) % 60) as minutes
from sakila.film;


-- How many movies longer than 3 hours?
select count(title )from film where length > 180;

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(first_name,"  ",last_name," - ", email) as customer_details from customer;

-- What's the length of the longest film title?
select title, length(title) from film order by length(title) desc limit 1;




