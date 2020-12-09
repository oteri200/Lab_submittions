
USE sakila;


-- n the table actor, which are the actors whose last names are not repeated? 
select first_name, last_name, count(last_name) as lstn from sakila.actor
group by last_name
having lstn=1;

-- nclude the last names of the actors where the last name was present more than once 
select first_name, last_name, count(last_name) as lstn from sakila.actor
group by last_name
having lstn>1;
 
-- Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(rental_id) from sakila.rental
group by staff_id;

-- Using the film table, find out how many films were released each year.
select * from sakila.film;
select release_year, count(film_id) from sakila.film
group by release_year;

-- Using the film table, find out for each rating how many films were there.
select rating, count(film_id) from sakila.film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, count(film_id), round(avg(length),2) from sakila.film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating, count(film_id), round(avg(length),2) as avg_dur from sakila.film
group by rating
having avg_dur>120;



