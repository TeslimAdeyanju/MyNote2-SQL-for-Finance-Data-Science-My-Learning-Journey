
-- Question 1
select name as category_name, count(*) as total_number_film
from film_category
join category
using (category_id)
group by name
with rollup;


-- question 2 

select 
       str.store_id,
       stf.staff_id,
       count(rt.rental_id) as Total_count
from store as str
join staff as stf using(store_id)
join rental as rt using (staff_id)
group by 
       store_id, 
       staff_id
       with rollup; 
       
       




