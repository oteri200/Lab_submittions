use sakila;
-- Drop column picture from staff.

alter table staff
drop column picture;
select * from customer where first_name like "%tammy%"; 

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.
--  Update the database accordingly.
insert into staff(first_name,last_name,address_id,email,store_id ,username) 
values (Tammy,Sander,"79","SANDERS@sakilacustomer.org","2",tammy);

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
# You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
#To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.
select * from customer where first_name like"%charlotte%" ;
select * from film where film_id = 1; #"like "%Academy Dinosaur%";
select * from inventory;
select * from rental;
select * from staff;
insert into rental(rental_id, rental_date,inventory_id,customer_id,return_date_staff_id,last_update)
Values (8999,2006-02-15,8999,130,2006-03-19,1,getdate());

#'Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer



