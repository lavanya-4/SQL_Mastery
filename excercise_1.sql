excercise 1

--sql
select * from payment where amount > 5;

--sql
select count(*) from actor where first_name ilike 'p%';

--sql
select distinct district from address;

--sql
select * from film where rating = 'R' and replacement_cost between 5 and 15;

--sql
select staff_id,count(payment_id) from payment group by staff_id order by staff_id

--sql
select rating, avg(replacement_cost) from film group by rating 

--sql
select customer_id,sum(amount) from payment group by customer_id order by sum(amount) desc limit 5

--sql
select customer_id,count(payment_id) from payment group by customer_id having count(payment_id) >= 40

--sql
select customer_id from payment where staff_id = 2 group by customer_id having sum(amount) > 100

--sql
select customer_id from payment where staff_id = 2 group by customer_id having sum(amount) > 110

--sql
select count(*) from film where title ilike 'J%'

--sql
select first_name, last_name from customer where first_name ilike 'E%' and address_id < 500 order by customer_id desc limit 1 