
use sakila;

-- Get all pairs of actors that worked together.
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name), concat(a2.first_name, ' ', a2.last_name)
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join actor a2 on a2.actor_id = fa2.actor_id;


-- Get all pairs of customers that have rented the same film more than 3 times.
-- Get all possible pairs of actors and films.
select
    concat(a.first_name,' ', a.last_name) as actor_name
    f.title
from sakila.actor a
cross join sakila.film as f;
