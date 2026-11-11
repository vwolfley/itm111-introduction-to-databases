/* 
 * Week 8 Assignment
 * Function Queries
 * Author: Vern Wolfley
 */
 
# -----------------------------------------
# Magazine Database Queries
# -----------------------------------------

 USE magazine;
 
# List the magazine name and then take 3% off the magazine price and round to 2 decimal places.
SELECT 
    magazineName, 
    ROUND(magazinePrice * 0.97, 2) AS '3% off'
FROM magazine;

# Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date, 
# how long in years, ROUNDED to the nearest year, has it been since their subscription started?
SELECT 
    subscriberKey,
    ROUND(DATEDIFF('2020-12-20', subscriptionStartDate) / 365.25) AS 'Years Since Subscription'
FROM subscription;

# Show the subscriptionStartDate and subscriptionLength and add the subscriptionLength 
# to the subscriptionStartDate to see the date of how long their subscription will go. 
# Format that date so it takes the format of Month name, number day with comma and then a 4 digit year.
SELECT 
    subscriptionStartDate,
    subscriptionLength,
    DATE_FORMAT(
        DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), 
        '%M %e, %Y') AS 'Subscription End'
FROM subscription;

# -----------------------------------------
# Bike Database Queries
# -----------------------------------------

USE bike;

# We need a list of all the products without the year at the end of the product_name string. 
# Notice that some have two years listed, make sure you take those off as well. 
# Order your results by product_id and limit your results to the first 14.
SELECT 
    TRIM(SUBSTRING_INDEX(product_name, ' - ', 1)) AS 'Product Name without Year'
FROM product
ORDER BY product_id
LIMIT 14;

# List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments. 
# Display one of the payments with a dollar sign, comma at the thousands place and two decimal places.
SELECT 
    product_name,
--     list_price,
    CONCAT('$', FORMAT(list_price / 3, 2)) AS 'One of 3 Payments'
FROM product
WHERE model_year = 2019;














