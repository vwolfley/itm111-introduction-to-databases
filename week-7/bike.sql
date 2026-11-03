# We need to clear out all our frame specific bikes and Women’s bikes. 
# They are not selling well and we will be displaying them in our annual sidewalk sale. 
# Find all of the bike product names with ‘Frame’ or ‘Frameset’ in the name or the word “Women’s”.

USE bike;

# Query all columns in product table
SELECT * 
FROM product 
WHERE product_name LIKE '%Frame%'
   OR product_name LIKE '%Frameset%'
   OR product_name LIKE '%Women''s%';

# Query for just product name
SELECT product_name 
FROM product 
WHERE product_name LIKE '%Frame%'
   OR product_name LIKE '%Frameset%'
   OR product_name LIKE '%Women''s%';
   
# Query for just product_name, model_year, list_price
SELECT product_name, model_year, list_price
FROM product 
WHERE product_name LIKE '%Frame%'
   OR product_name LIKE '%Frameset%'
   OR product_name LIKE '%Women''s%';
   



