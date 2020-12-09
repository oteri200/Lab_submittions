
use sakila;

-- Write a query to display for each store its store ID, city, and country.
select * from sakila.store as s
join sakila.city as ct
on s.last_update = ct.last_update
join sakila.country as c
on c.country_id = ct.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as total_business from sakila.staff as s join sakila.store as st
on s.store_id=st.store_id
join sakila.payment as p
on s.staff_id=p.staff_id
group by store_id;

-- What is the average running time of films by category?
select category_id, avg(length) from sakila.film as f
join sakila.film_category as fc
using (film_id)
join sakila.category as c
using (category_id)
group by category_id;

-- Which film categories are longest?
select name, avg(length) from sakila.film as f
join sakila.film_category as fc
using (film_id)
join sakila.category as c
using (category_id)
group by name
order by avg(length) desc
limit 1;

-- Display the most frequently rented movies in descending order.
select name, avg(rental_rate) as most_freq_rented from sakila.film as f
join sakila.film_category as fc
using (film_id)
join sakila.category as c
using (category_id)
group by name
order by avg(rental_rate) desc 
limit 5;

-- List the top five genres in gross revenue in descending order.??????
select name, category_id, sum(amount) as 'gross revenue' from sakila.payment as p
join sakila.rental as r using (rental_id)
join sakila.inventory as i using (inventory_id)
join sakila.film_category as f using (film_id)
join sakila.category as c using (category_id)
group by category_id
order by 'gross revenue' asc
limit 5;

