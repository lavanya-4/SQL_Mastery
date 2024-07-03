
----------------------------  joins ----------------------------------

--sql
select district,email from customer inner join address on customer.address_id = address.address_id where address.district = 'California';

--sql
select title, first_name,last_name from actor inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
where first_name= 'Nick' and last_name  = 'Wahlberg';

--------assessment -2 -----------------------------------------------

-----1. How can you retrieve all the information from the cd.facilities table?

--sql
select * from cd.facilities;

----2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

--sql
select name, membercost from cd.facilities;

--- 3. How can you produce a list of facilities that charge a fee to members?

--sql
select * from cd.facilities where membercost !=0;

-- 4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question

--sql
select facid,name,membercost,guestcost from cd.facilities where membercost > 0 and membercost < (monthlymaintenance/50)

--5. How can you produce a list of all facilities with the word 'Tennis' in their name?
--sql
select * from cd.facilities where  name ilike '%Tennis%';

--6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

--sql
select * from cd.facilities where facid in (1,5);

--sql
select memid,surname,firstname,joindate from cd.members where joindate >= '2012-09-1'

--sql
select distinct surname from cd.members order by surname asc limit 10;

--sql
select joindate from cd.members order by joindate desc limit 1;

--sql
select count(*) from cd.facilities where guestcost >=10;

--sql
select cd.facilities.facid,sum(cd.bookings.slots) as total_slots from cd.bookings inner join cd.facilities on cd.bookings.facid = cd.facilities.facid 
where cd.bookings.starttime between '2012-09-1' and '2012-09-30' group by cd.facilities.facid 
order by sum(cd.bookings.slots)

--sql
select facid,sum(slots) as total_count from cd.bookings group by facid having sum(slots) > 1000 order by facid

--sql
select cd.bookings.starttime, cd.facilities.name from cd.bookings inner join cd.facilities on cd.bookings.facid = cd.facilities.facid 
where cd.bookings.starttime >= '2012-09-21' and cd.bookings.starttime < '2012-09-22' and cd.facilities.name ilike '%Tennis Court%'
order by cd.bookings.starttime

--sql
select starttime from cd.bookings inner join cd.members on cd.bookings.memid = cd.members.memid where firstname = 'David' and surname = 'Farrell'


