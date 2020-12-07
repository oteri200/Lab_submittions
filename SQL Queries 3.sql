use sakila ;

-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select distinct(language_id)from film;

-- How many movies were released with "PG-13" rating?
select count(title) from film where rating = "PG-13";

-- Get 10 the longest movies from 2006.
 select * from film where release_year = "2006" order by length desc limit 10;
 
-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from rental;


-- Show rental info with additional columns month and weekday. Get 20.

select date_format(rental_date, "%M") as Month, date_format(rental_date, "%W") as Week_day from rental limit 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
	select *, 
			case when date_format(rental_date, "%W") in ("Saturday", "Sunday")
            then "weekend"
            else "workday" end as day_type
   from rental;         
    

-