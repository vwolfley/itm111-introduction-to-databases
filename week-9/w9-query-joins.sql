/* 
 * Week 9 Assignment
 * Joins
 * Author: Vern Wolfley
 */
 
# -----------------------------------------
# V_Art Database Queries
# -----------------------------------------

USE v_art;

SELECT *
FROM artwork;

# 1. - you search by Period/Style and you choose Impressionism, you get two resulting images ("Woman in the Garden" and "Irises"). 
# What query would be used in the code here to allow the user to see these images? No join is needed.
 
SELECT artfile
FROM artwork
WHERE period = "impressionism";

# 2. - search by Subject and type in the word flower, you get three images.
# What query would have allowed the user to get those results (remember, the keyword might have been 'flowers' but they typed 'flower') .
# Three tables will need to be joined to get from keywords to the art files.

SELECT artfile
FROM artwork aw
JOIN artwork_keyword ak ON ak.artwork_id = aw.artwork_id
JOIN keyword kw ON kw.keyword_id = ak.keyword_id
WHERE kw.keyword LIKE '%flower%';

# 3. - List all the artists from the artist table, but only the related artwork from the artwork table. 
# We need the first name, last name, and artwork title.

SELECT ar.fname, ar.lname, title
FROM artist ar
LEFT JOIN artwork aw ON aw.artist_id = ar.artist_id;

# -----------------------------------------
# Magazine Database Queries
# -----------------------------------------

USE magazine;

# 4. - List all subscriptions with the magazine name, last name, first name, and sort alphabetically by magazine name. 

SELECT m.magazineName, sc.subscriberLastName, sc.subscriberFirstName
FROM subscription s
JOIN magazine m ON m.magazineKey = s.magazineKey
JOIN subscriber sc ON sc.subscriberKey = s.subscriberKey
ORDER BY m.magazineName;

# 5.  List all the magazines that Samantha Sanders subscribes to. 

SELECT m.magazineName
FROM subscription s
JOIN magazine m ON m.magazineKey = s.magazineKey
JOIN subscriber sc ON sc.subscriberKey = s.subscriberKey
WHERE sc.subscriberLastName = "Sanders" AND sc.subscriberFirstName = "Samantha";

# -----------------------------------------
# Employees Database Queries
# -----------------------------------------

USE employees;

# 6. List the first five employees from the Customer Service Department. 
# Put them in alphabetical order by last name.

SELECT e.first_name, e.last_name
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Customer Service'
ORDER BY e.last_name
LIMIT 5;

# 7. Find out the current salary and department of Berni Genin. 
# You can use the ORDER BY and LIMIT to get just the most recent salary.

SELECT e.first_name, e.last_name, d.dept_name, s.salary, de.from_date
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE e.first_name = 'Berni' AND e.last_name = 'Genin'
ORDER BY s.from_date DESC, de.from_date DESC
LIMIT 1;

# With Salary Formated
SELECT e.first_name, e.last_name, d.dept_name,
       CONCAT('$', FORMAT(s.salary, 2)) AS salary,
       de.from_date
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE e.first_name = 'Berni' AND e.last_name = 'Genin'
ORDER BY s.from_date DESC, de.from_date DESC
LIMIT 1;









