
/* Question 1: Basic ROLLUP with Single Column*/
select name as category_name, count(*) as total_number_film
from film_category
join category
using (category_id)
group by name
with rollup;


/* Question 2: Basic ROLLUP with Two Columns*/

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
       
       
/* Question 3: Understanding NULL in ROLLUP Results*/ 
SELECT 
    ct.country, 
    cc.city,
    COUNT(ct.country) AS 'country count', 
    COUNT(cc.city)    AS 'city count'
FROM
    customer AS c
JOIN 
    address AS ad 
USING 
    (address_id)
JOIN 
    city AS cc 
USING 
    (city_id)
JOIN 
    country AS ct 
USING 
    (country_id)
GROUP BY 
    ct.country, cc.city WITH rollup












