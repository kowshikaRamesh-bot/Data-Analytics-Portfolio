CREATE DATABASE superstore_db;
use superstore_db;
SELECT * FROM superstore LIMIT 10;
DESCRIBE superstore;
SELECT ROUND (SUM(sales),2) as total_sales 
FROM superstore;
SELECT  category,
ROUND (SUM(sales),2) as total_sales
FROM superstore 
GROUP BY category
ORDER by total_sales DESC;
SELECT state,
ROUND (SUM(sales),2) as total_sales 
FROM superstore 
GROUP by state 
ORDER BY total_sales DESC 
LIMIT 5;
SELECT segment,
COUNT(*) as total_orders,
ROUND(SUM(sales),2) as total_sales 
FROM superstore 
GROUP BY segment 
ORDER BY total_sales DESC;
SELECT `Customer Name`,
ROUND (SUM(sales),2) as total_sales 
FROm superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;
SELECT 
YEAR(`ORDER date`) as year,
MONTH (`ORDER date`) as month,
ROUND (SUM(Sales),2) as monthly_sales
FROM superstore 
GROUP BY YEAR(`ORDER DATE`), MONTH (`order date`)
ORDER BY year,month;
SELECT `Product Name`,
ROUND (SUM(Profit),2) as total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit DESC 
LIMIT 10;
SELECT `Product Name`,
ROUND(SUM(Profit),2) as total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;
SELECT `SHIP MODE`,
COUNT(*) as total_orders,
ROUND(AVG(Sales),2) as avg_sales
FROM superstore
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;
SELECT State,
ROUND (SUM(sales),2) as total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC ) as sales_rank
FROM superstore
GROUP BY State
ORDER BY sales_rank;
use superstore_db;
WITH customer_sales AS(
SELECT `Customer Name`,
ROUND (SUM(Sales),2) as total_sales
FROM superstore
GROUP BY `Customer Name`
)
SELECT * FROM customer_sales
ORDER BY total_sales DESC 
LIMIT 5;
WITH category_profit AS(
SELECT Category,
ROUND(SUM(Sales),2) as total_sales ,
ROUND (SUM(Profit),2) as total_profit,
ROUND(AVG(Profit),2) as avg_profit
FROM superstore
GROUP BY category
)
SELECT *,
RANK()OVER(ORDER BY total7_profit DESC) as profit_rank
FROM category_profit;
SELECT `Customer Name`,
ROUND(SUM(Sales),2)as total_sales
FROM superstore
GROUP BY `Customer Name`
HAVING SUM(Sales)>(
SELECT AVG(Sales)
FROM superstore
);
SELECT `Region`,
ROUND(SUM(Sales),2) as total_sales
FROM superstore 
GROUP BY Region
HAVING SUM(Sales)= (
SELECT MAX(region_sales)
FROM(
SELECT SUM(Sales) as region_sales
FROM superstore 
GROUP BY Region
)as sub
);