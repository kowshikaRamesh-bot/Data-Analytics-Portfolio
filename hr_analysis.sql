use hr_db;
SHOw tables;
describe `wa_fn-usec_-hr-employee-attrition`;
ALTER TABLE `wa_fn-usec_-hr-employee-attrition` RENAME TO hr_employee;
SELECT * FROM hr_employee LIMIT 10;
use HR_DB;
SELECT COUNT(*) AS total_employees
FROM hr_employee;
SELECT Attrition, COUNT(*) as count
FROM hr_employee
GROUP BY Attrition;
SELECT Department,COUNT(*) as total
FROM hr_employee
GROUP BY Department
ORDER BY total DESC;
SELECT department, ROUND(AVG(ï»¿Age),1) as avg_age 
FROM hr_employee
GROUP BY Department ;
SELECT BusinessTravel, COUNT(*) as count 
FROM hr_employee
GROUP BY BusinessTravel 
ORDER BY count DESC;
SELECT Department ,
ROUND(AVG(DailyRate),2) as avg_daily_rate
FROM hr_employee
GROUP BY Department 
ORDER BY avg_daily_rate DESC;
SELECT Department, Attrition, COUNT(*) as count 
FROM hr_employee
GROUP  BY Department , Attrition
ORDER BY Department;
SELECT ï»¿Age, Department, DailyRate 
FROM hr_employee
WHERE DailyRate > (SELECT AVG (DailyRate ) FROM hr_employee)
LIMIT 10;
SELECT Department,
ROUND(AVG(DailyRate),2) as avg_rate,
RANK() OVER (ORDER BY AVG(DailyRate) DESC )as dept_rank
FROM hr_employee
GROUP BY Department;
WITH attrition_dept AS(
SELECT Department,
COUNT(*) as total_employees,
SUM(CASE WHEN Attrition ='Yes' THEN 1 ELSE 0 END) as left_employees
FROM hr_employee
GROUP BY Department 
)
SELECT *,
ROUND((left_employees/ total_employees)*100,2) as attrition_rate
FROM attrition_dept
ORDER BY attrition_rate DESC;
Use e_commerce;
DROP TABLE IF EXISTS ecommerce_sales;