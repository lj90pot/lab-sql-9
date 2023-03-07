/*Luis*/
use sakila; 
#Check months in rental table
select max(rental_date),min(rental_date) from rental order by rental_date desc;

#Create table for may
create table rentals_may like rental; 
#insert data for may
insert into rentals_may
	select * 
	from rental
    where month(rental_date)=5 ;
#Test data
select * from  rentals_may;   

#Create table for june
create table rentals_june like rental;
#insert data for june
insert into rentals_june
	select * 
	from rental
    where month(rental_date)=6 ;
#Test data
select * from  rentals_june;  

#Check the number of rentals for each customer for May.
select
	r.customer_id
    ,c.first_name
    ,c.last_name
	,count(*) as num_rentals
from rentals_may r
	inner join customer c on r.customer_id=c.customer_id
group by r.customer_id,c.first_name, c.last_name
order by num_rentals desc;

#Check the number of rentals for each customer for June.  
select
	r.customer_id
    ,c.first_name
    ,c.last_name
	,count(*) as num_rentals
from rentals_june r
	inner join customer c on r.customer_id=c.customer_id
group by r.customer_id,c.first_name, c.last_name
order by num_rentals desc;
  
