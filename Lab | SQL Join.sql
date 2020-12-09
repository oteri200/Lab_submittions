
use sakila;

-- List number of films per category.
select category_id, count(film_id)from film_category group by category_id;

-- Display the first and last names, as well as the address, of each staff member.
select s.staff_id,s.first_name, s.last_name, a.address from sakila.staff s left join sakila.address a
on s.address_id=a.address_id;

-- Display the total amount rung up by each staff member in August of 2005.
select staff_id, sum(amount) from payment where convert (payment_date, date) between '2005-08-01' and '2005-08-31'
group by staff_id;

select staff_id, date_format(payment_date, '%m %d  %y') as days, sum(amount) from sakila.payment
where convert (payment_date, date) between '2005-08-01' and '2005-08-31'
group by staff_id;

-- List each film and the number of actors who are listed for that film.
select f.title,count(fa.actor_id) from sakila.film f left join sakila.film_actor fa
on f.film_id=fa.film_id
group by f.title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.last_name, sum(p.amount) from sakila.customer c inner join sakila.payment p
on c.customer_id=p.customer_id
group by c.last_name order by c.last_name asc;
