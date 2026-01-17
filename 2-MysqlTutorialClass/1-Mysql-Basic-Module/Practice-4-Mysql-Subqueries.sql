


SELECT 
   MAX(ratio)
FROM ( SELECT
      customername,
      SUM(amount) AS total_spend,
      COUNT(customername) AS number_of_transaction,
      ROUND(SUM(amount)/COUNT(customername),2) AS ratio
   FROM customers
   JOIN payments
   USING (customerNumber)
   GROUP BY
      customername
   ORDER BY
      number_of_transaction) AS a


--
SELECT o.customername, count(o.orders) as order
from customers as c
join payments  as p on c.customerNumber = p.customerNumber
join orders    as o on o.customernumber = c.customerNumber
group by o.customernumber


