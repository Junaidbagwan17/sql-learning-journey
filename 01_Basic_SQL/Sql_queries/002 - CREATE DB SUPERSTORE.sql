# STEP 1 CREATE DB
CREATE DATABASE retail_practice;

# STEP 2 USE DB
USE retail_practice;

# STEP 3 CREATE NEW TABLE STRUCTURE
-- (Define your column names and matching data types here)
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(20),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(15),
    region VARCHAR(20),
    product_id VARCHAR(30),
    category VARCHAR(30),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,4)
);


-- you can skip step 4 but see
#STEP 4 : TO LOAD CSV ROWS MAKE IT ON (No LOCAL keyword or global flags needed)
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;


-- STEP 5: PASTE FILE IN SECURE DIRECTORY
-- [Action Required]: Copy your local Downloades CSV file from your files.
-- c drive u must enable show hidden folders 
-- [Action Required]: Paste it into: C:\ProgramData\MySQL\MySQL Server 26.7\Uploads\
-- Note: Turn on "Hidden items" in Windows File Explorer view settings to see ProgramData.


-- -- STEP 4: RUN INFILE COMMAND )
--  other files (like customers.csv or products.csv) only contained standard plain text. The Sample - Superstore.csv file contains special formatted characters (like curly quotes, dashes, or symbols from Excel) in rows like 'Konftel 250 Conference' that break the default import settings.

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 26.7/Uploads/Sample - Superstore.csv'
INTO TABLE superstore
CHARACTER SET latin1 -- 👈 The character set line must be placed right here
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


SELECT * FROM superstore;