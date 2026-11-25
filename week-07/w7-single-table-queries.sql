/* 
 * Week 7 Assignment
 * Single Table Queries
 * Author: Vern Wolfley
 */

# -----------------------------------------
# Virtual Art Gallery Application Queries
# -----------------------------------------
USE art_gallery;

SELECT * 
FROM artist;

# Question 1
INSERT INTO artist 
VALUES (DEFAULT, 'Johannes', NULL, 'Vermeer', 1632, 1674, 'Netherlands', 'n');

# Question 2
SELECT * 
FROM artist 
ORDER BY lname ASC;

# Question 3
# I am assuming since this is a backend operation when the manager clicked on edit it knows the artist_id
UPDATE artist 
SET dod='1675' 
WHERE artist_id = 9;

# Question 4
# I am assuming since this is a backend operation when the manager clicked on edit it knows the artist_id
DELETE FROM artist
WHERE artist_id = 9;

# -------------------------
# Bike Shop Queries
# -------------------------
USE bike;

# Question 5
SELECT first_name, last_name, phone
FROM customer
WHERE state = 'TX' AND city = 'Houston';

# Question 6
SELECT 
    product_name, 
    list_price, 
    (list_price - 500) AS 'Discount Price'
FROM product
WHERE list_price >= 5000.00
ORDER BY list_price DESC;

# Question 7
SELECT first_name, last_name, email
FROM staff
WHERE store_id != 1;

# Question 8
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';

# Question 9
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price ASC;

# Question 10
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL 
  AND (city LIKE '%ach%' OR city LIKE '%och%') OR last_name = 'William'
LIMIT 5;
