use e_commerce;
SHOW tables;
SELECT * FROM amazon_sales LIMIT 50;
SELECT COUNT(*) as total_orders
FROM amazon_sales;
SELECT Status, COUNT(*) as count
FROM amazon_sales
GROUP BY Status
ORDER BY count DESC;
SELECT Category, COUNT(*) as total_orders
FROM amazon_sales
GROUP BY Category
ORDER BY total_orders DESC;
SELECT Fulfilment, COUNT(*) as count
FROM amazon_sales
GROUP BY Fulfilment
ORDER BY count DESC;
SELECT `Sales Channel` , COUNT(*) as count
FROM amazon_sales
GROUP BY `Sales Channel`
ORDER BY count DESC;
SELECT `ship-service-level`,COUNT(*) as count
FROM amazon_sales
GROUP BY `ship-service-level`
ORDER BY count DESC;
SELECT Category, Status, COUNT(*) as count
FROM amazon_sales
GROUP BY Category, Status
ORDER BY Category;
SELECT SKU, COUNT(*) as order_count
FROM amazon_sales 
GROUP BY SKU 
ORDER BY order_count DESC
LIMIT 10;
SELECT Size, COUNT(*) as count
FROM amazon_sales
GROUP BY Size
ORDER BY count DESC;
SELECT Category,
COUNT(*) as total_orders,
RANK () OVER(ORDER BY COUNT(*) DESC) as category_rank
FROM amazon_sales
GROUP BY Category;
WITH category_status AS(
SELECT Category,
COUNT(*) as total_orders,
SUM(CASE WHEN Status='Shipped' THEN 1 ELSE 0 END ) as shipped_orders
FROM amazon_sales
GROUP BY Category
);
ROUND ((shipped_orders/total_orders)*100,2) as shipped_percentage
FROM category_status
ORDER BY shipped_percentage DESC;
