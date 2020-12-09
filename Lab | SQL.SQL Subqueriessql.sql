
use sakila;
-- How many copies of the film Hunchback Impossible exist in the inventory system?
select count(film_id) as counts from inventory
where film_id = (
select film_id from film
where title = 'Hunchback Impossible'
);

-- List all films whose length is longer than the average of all the films.
select * from film where length >(select avg(length) from film);

-- Use subqueries to display all actors who appear in the film Alone Trip
select concat(first_name , ' ' , last_name) as Actor
from actor where actor_id in (select actor_id from sakila.film_actor where film_id = (select film_id from sakila.film
where title = 'ALONE TRIP'));

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion.
--  Identify all movies categorized as family films.
select title as Title from sakila.film where film_id in (select film_id from sakila.film_category
where category_id in (select category_id from sakila.category where name = 'Family' ) );

-- Get name and email from customers from Canada using subqueries. Do the same with joins.
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys,
--  that will help you get the relevant information.

-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
--  First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select customer_id from customer
inner join payment using (customer_id) group by customer_id
order by sum(amount) desc
limit 1;


-- Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select film_id, title, rental_date, amount from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
inner join payment using (rental_id)
where rental.customer_id = (
select customer_id
from customer
inner join payment
using (customer_id)
group by customer_id
order by sum(amount) desc
limit 1
)
order by rental_date desc;
-- Customers who spent more than the average payments.
select customer_id, sum(amount) as payment
from sakila.customer
inner join payment using (customer_id)
group by customer_id
having sum(amount) > (
select avg(total_payment)
from (
select customer_id, sum(amount) total_payment
from payment
group by customer_id
) t
)
order by payment desc;