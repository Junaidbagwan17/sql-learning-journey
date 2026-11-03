use retail_practice;

-- Find the total sales for each product category.

SELECT DISTINCTROW(category)
FROM superstore;

SELECT category, SUM(sales) As totalsales
FROM superstore
GROUP BY category;


--  find avgproduct and total sales for each region

SELECT region, SUM(sales) AS total_sales, 
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY region;

-- Now find how many rows belong to each product category.
SELECT category , COUNT(*) AS total_rows
FROM superstore
GROUP BY category;

-- Find the total sales for each region and display the regions from highest total sales to lowest total sales.
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY region DESC;

-- Question: Show only the regions whose total sales are greater than 100,000.
SELECT region, SUM(sales) AS total_Sales
FROM superstore
GROUP BY region
HAVING total_sales > 100000;


-- Find each product category's total profit, but show only categories whose total profit is greater than 10,000. Sort the results from highest total profit to lowest.

SELECT category , SUM(profit) AS total_profit
FROM superstore
GROUP BY category
HAVING total_profit > 10000
ORDER BY total_profit DESC;


-- calculate the total sales for each product category, considering only rows where sales is greater than 100
SELECT category, SUM(sales) AS total_sales
FROM superstore
WHERE sales > 100
GROUP BY category;


-- Find the total profit for each region, but include only rows where profit > 0.
SELECT region, SUM(profit) AS total_profit
FROM superstore
WHERE profit > 0
GROUP BY region;

-- Show only regions where the total profit, including both positive and negative profits, is greater than ₹10,000.
SELECT region, SUM(profit) AS total_profit
FROM superstore
GROUP BY region
HAVING total_profit > 10000;

-- Find the average sales for each category, but show only categories whose average sales are greater than 200.
SELECT category, AVG(sales) AS avg_sales
FROM superstore
GROUP BY category
HAVING AVG(sales) > 200;

-- Find the number of rows in each sub_category, but display only sub-categories with more than 100 rows.
SELECT sub_category, COUNT(*) total_rows
FROM superstore
GROUP BY sub_category
HAVING total_rows > 100;

-- Find the total sales for each region, considering only rows where profit > 0. Then display only regions whose resulting total sales exceed 100,000.
SELECT region ,SUM(sales) as total_sales
FROM superstore
WHERE profit > 0
GROUP BY region
HAVING total_sales > 100000;

-- Show each category and its total number of rows, but only include categories with more than 2,000 rows. Sort the results from the highest row count to the lowest.
SELECT category, COUNT(*) AS total_rows
FROM superstore
GROUP BY category
HAVING total_rows > 2000
ORDER BY total_rows DESC;

# MIXED
use retail_practice;

-- Using your superstore table, find the total sales for each region, but:
-- - Include only rows where profit > 0.
-- - Show only regions whose total sales exceed 100,000.
-- - Sort by total sales from highest to lowest.

SELECT region, SUM(sales) AS total_sales
FROM superstore
WHERE profit > 0
GROUP BY region 
HAVING total_sales > 10000
ORDER BY total_sales DESC;
