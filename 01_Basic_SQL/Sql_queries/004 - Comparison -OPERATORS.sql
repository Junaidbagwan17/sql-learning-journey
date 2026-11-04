USE retail_practice;


# AND OR

-- Q1. Display all records where region is 'West'
-- AND sales are greater than 500.
SELECT *
FROM superstore
WHERE region = 'West' 
AND sales > 500;
-- Q2. Display all records where category is 'Technology'
-- AND profit is greater than 100.
SELECT *
FROM superstore
WHERE profit > 100 AND category = 'Technology';
-- Q3. Display all records where region is either 'East' OR 'West'.
SELECT *
FROM superstore
WHERE region = 'East' OR region = 'West';
-- Q4. Display customer_name, city, and sales
-- where sales are greater than 1000 OR profit is greater than 200.
SELECT customer_name, city, sales 
FROM superstore
WHERE sales > 1000 OR profit > 200;
-- Q5. Display all records where category is 'Furniture'
-- AND quantity is greater than 3 AND profit is positive.

SELECT *
FROM superstore
WHERE category = 'Furniture'
AND quantity > 3 AND profit > 1;



# IN 
USE retail_practice;

-- Q1. Display all records where region is either Central or South.
SELECT * 
FROM superstore
WHERE region IN ('Central', 'South');

-- Q2. Display all records where category is either Office Supplies or Furniture.
SELECT *
FROM superstore
WHERE category IN ('Office Supplies', 'Furniture');
-- Q3. Display all records where ship_mode is NOT First Class or Same Day.
SELECT * 
FROM superstore
WHERE ship_mode NOT IN ('First Class', "Same Day");
-- Q4. Display customer_name and sales
-- where city is either Los Angeles or Seattle.
SELECT customer_name, sales 
FROM superstore
WHERE city IN ('Los Angeles', 'Seattle');
-- Q5. Display order_id and profit
-- where category is NOT Technology.

SELECT order_id, profit 
FROM superstore
WHERE category != 'Technology';


# -- BETWEEN
USE retail_practice;

-- Q1. Display all records where sales are between 100 and 500.
SELECT *
FROM superstore 
WHERE sales BETWEEN 100 AND 500;

-- Q2. Display customer_name and profit
-- where profit is between 50 and 200.
SELECT customer_name, profit
FROM superstore
WHERE profit BETWEEN 50 AND 200;
-- Q3. Display all records where quantity is between 2 and 5.
SELECT *
FROM superstore 
WHERE quantity BETWEEN 2 AND 5;

-- Q4. Display order_id and sales
-- where sales are between 1000 and 5000.

SELECT order_id AND sales
FROM superstore
WHERE sales BETWEEN 1000 AND 5000;
-- Q5. Display all records where discount is between 0.10 and 0.30.
SELECT *
FROM superstore
WHERE discount BETWEEN 0.10 AND 0.30;


-- Q1. Display all records where sales are between 100 and 500.
SELECT *
FROM superstore 
WHERE sales BETWEEN 100 AND 500;

-- Q2. Display customer_name and profit
-- where profit is between 50 and 200.
SELECT customer_name, profit
FROM superstore
WHERE profit BETWEEN 50 AND 200;
-- Q3. Display all records where quantity is between 2 and 5.
SELECT *
FROM superstore 
WHERE quantity BETWEEN 2 AND 5;

-- Q4. Display order_id and sales
-- where sales are between 1000 and 5000.

SELECT order_id AND sales
FROM superstore
WHERE sales BETWEEN 1000 AND 5000;
-- Q5. Display all records where discount is between 0.10 and 0.30.
SELECT *
FROM superstore
WHERE discount BETWEEN 0.10 AND 0.30;


#LIKE Wildcards %	Matches zero or more characters _	Matches exactly one character

USE retail_practice;

-- Q1. Display all records where customer_name starts with 'M'.
SELECT *
FROM superstore
WHERE customer_name LIKE 'M%'; 
-- Q2. Display all records where customer_name ends with 's'.
SELECT *
FROM superstore
WHERE customer_name LIKE '%s';
-- Q3. Display all records where product_name contains the word 'Chair'.
SELECT *
FROM superstore
WHERE product_name LIKE '%Chair%';
-- Q4. Display customer_name and city
-- where customer_name has 'son' anywhere in the name.
SELECT * 
FROM superstore
WHERE customer_name LIKE '%son%';

-- Q5. Display all records where product_name starts with 'A'
-- and has any number of characters after it.
SELECT *
FROM superstore
WHERE product_name LIKE 'A%';



-- IS NULL and IS NOT NULL
USE retail_practice;

-- Q1. Display all records where postal_code is NULL.
SELECT * FROM
superstore
WHERE postal_code IS NULL;
-- Q2. Display all records where postal_code is NOT NULL.
SELECT * 
FROM superstore
WHERE postal_code IS NOT NULL;

-- Q3. Display customer_name and postal_code
-- where postal_code is NULL.
SELECT customer_name, postal_code
FROM superstore
WHERE postal_code is NULL;

-- Q4. Display order_id and city
-- where city is NOT NULL.
SELECT order_id , city
FROM superstore
WHERE city IS NOT NULL;


-- Q5. Display all records where ship_date is NULL.
SELECT * 
FROM superstore
WHERE ship_date IS NULL;



-- Q1. Display only customer_name and city
-- where postal_code is NULL.
SELECT customer_name, city 
FROM superstore
WHERE postal_code IS NULL;

-- Q2. Display only order_id and ship_date
-- where ship_date is NOT NULL.
SELECT order_id , ship_date
FROM superstore
WHERE ship_date IS NOT NULL;