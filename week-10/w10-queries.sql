/* 
 * Week 10 Assignment
 * Summary Queries
 * Author: Vern Wolfley
 */
 
# -----------------------------------------
# Bike Database Queries
# -----------------------------------------

USE bike;

# 1. Get the average quantity that we have in all our bike stocks. Round to the nearest whole number. 

SELECT ROUND(AVG(quantity)) AS "Stock Average"
FROM stock;

# 2. Show each bike that needs to be reordered--(meaning our stock is low for that bike and we need to order more).
# Filter the results to only the lowest quantity of zero. 
# Order by product_name The image below show the first 12 of 24 rows total. 
# You don't need to use a LIMIT.  
# (Hint for this one: Two different stores have the same bike that needs to be reordered. You only need it to show up once.)

SELECT DISTINCT p.product_name
FROM product p
JOIN stock s 
    ON p.product_id = s.product_id
WHERE s.quantity = 0
ORDER BY p.product_name;

# 3. How many of each category of bikes do we have in our "Baldwin Bikes" store, which has the store_id of 2.
# We need to see the name of the category as well as the number of bikes in the category. Sort it by lowest numbers first. 

SELECT c.category_name, 
    COUNT(s.quantity) AS `In Stock`
FROM category c
JOIN product p 
    ON c.category_id = p.category_id
JOIN stock s 
    ON p.product_id = s.product_id
WHERE s.store_id = 2
GROUP BY c.category_name
ORDER BY `In Stock` ASC;

# -----------------------------------------
# Employee Database Queries
# -----------------------------------------

USE employees;

# 4. How many employees do we have?

SELECT COUNT(e.emp_no) AS "Number of Employees"
FROM employees e;

# 5. Get the average salaries in each department. 
# We only need those departments that have average salaries that are below 60,000
# Format the salary to 2 decimal places and a comma in the thousands place. 

SELECT d.dept_name, 
    FORMAT(AVG(salary), 2) AS average_salary
FROM departments d
JOIN dept_emp de
	ON d.dept_no = de.dept_no
JOIN salaries s
	ON s.emp_no = de.emp_no
GROUP BY d.dept_name
HAVING AVG(salary) < 60000;

# 6. Find out how many females work in each department. 
# Sort by department name.

SELECT d.dept_name,
	COUNT(e.gender) AS "Number of Females"
FROM departments d
JOIN dept_emp de
	ON de.dept_no = d.dept_no
JOIN employees e
	ON e.emp_no = de.emp_no
WHERE e.gender = "f"
GROUP BY d.dept_name
    

