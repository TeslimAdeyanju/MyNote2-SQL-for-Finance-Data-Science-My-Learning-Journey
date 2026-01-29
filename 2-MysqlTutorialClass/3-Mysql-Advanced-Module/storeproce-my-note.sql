SELECT DISTINCT
    c.customerName,
    c.city, 
    c.state, 
    c.creditLimit,
    COUNT(DISTINCT ord.orderNumber) as total_orders,
    max(ordt.priceeach) as highest_item_purchased
FROM customers AS c
JOIN orders AS ord 
USING 
    (customernumber)
JOIN orderdetails AS ordt 
USING 
    (ordernumber)
WHERE c.state is NOT null 
and 
    ordt.priceeach > 
    (   SELECT
            ROUND(AVG(average_price), 2)
        FROM(   SELECT
                    o.orderDate,
                    o.shippedDate,
                    od.priceEach AS average_price
                FROM orderdetails AS od
                JOIN orders AS o
                USING
                    (ordernumber)
                JOIN products AS p
                USING
                    (productcode)
                WHERE
                    priceeach > 100) 
GROUP by 
 c.customerNumber,
    c.customerName,
    c.city,
    c.state,
    c.creditLimit
ORDER BY highest_item_purchased DESC;