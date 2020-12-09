use sakila;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

select title,length,rank() over (Order by length) ranks from film where length is not null and length> 0;


-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, rating and the rank.
select title, length, rating, rank() over (partition by rating order by length desc) as ranks from film 
where length is not null and length > 0;



-- How many films are there for each of the categories in the category table.
--  Use appropriate join to write this query

select name as cat_name, count(*) as films_count
from sakila.category inner join sakila.film_category using (category_id) group by name order by num_films desc;

-- Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count from sakila.actor join sakila.film_actor using (actor_id)
group by actor_id order by film_count desc limit 1;

-- Most active customer (the customer that has rented the most number of films)

select customer.*,
count(rental_id) as rental_num
from sakila.customer join sakila.rental using (customer_id)
group by customer_id
order by rental_count desc
limit 1;


