# 001 - SQL Fundamentals

This is my first SQL learning project, where I practiced the fundamentals of SQL using a MySQL database named `EnterpriseAnalytics`.

- Created databases and tables, and practiced `CREATE`, `ALTER`, `INSERT`, `UPDATE`, and `DELETE` operations.
- Learned data retrieval and filtering using `SELECT`, `WHERE`, `DISTINCT`, `AND`, `OR`, `IN`, `BETWEEN`, and `LIKE`.
- Practiced sorting, limiting records, aggregate functions, `GROUP BY`, and `HAVING`.
- Explored `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and subqueries.
- Learned string functions, date functions, and NULL value handling.
- Practiced advanced SQL concepts including Window Functions, CTEs, `UNION`, and `UNION ALL`.

**Goal:** Build a strong foundation in SQL through hands-on practice and gradually improve my database querying skills.
# Superstore SQL Database Setup

This repository contains the database schema and initialization scripts to set up the **Superstore** dataset in MySQL for data analysis practice. 

## 📁 002 CREATE DB SUPERSTORE
* **`002 - CREATE DB SUPERSORTE.sql`**: The primary SQL script that creates the database, configures the table structures, and handles the data import.
---
## 🛠️ Installation & Data Import Guide

Because modern MySQL servers have strict security configurations (`secure_file_priv`) and character encoding rules, follow these exact steps to load the data successfully without errors.

### Step 1: Create the Database & Table Structure
Open MySQL Workbench, open the `002 - CREATE DB SUPERSORTE.sql` script, and execute the database and table creation parts:
```sql
CREATE DATABASE IF NOT EXISTS retail_practice;
USE retail_practice;

-- (Execute the CREATE TABLE superstore statement included in the script)
```

### Step 2: Move the CSV File to the Secure Uploads Directory
MySQL blocks importing files directly from standard user folders (causing *Error 1290*). You must place your source CSV file into MySQL's trusted folder:

1. Copy your `Sample - Superstore.csv` file.
2. Navigate to the hidden MySQL system folder on your computer:
   📁 `C:\ProgramData\MySQL\MySQL Server 26.7\Uploads\`
3. Paste the CSV file directly into this folder.

> 💡 *Note: If you cannot see the `ProgramData` folder, open Windows File Explorer, click **View** at the top menu, and check the box for **Hidden items**.*

### Step 3: Execute the Data Load Command
Run the final `LOAD DATA INFILE` block in your script. 

To prevent character corruption errors (*MySQL Error 1300*) caused by special formatting symbols or Excel quotes (e.g., `'Konftel 250 Conference'`), the script uses the `CHARACTER SET latin1` clause positioned precisely after the table definition:

```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 26.7/Uploads/Sample - Superstore.csv'
INTO TABLE superstore
CHARACTER SET latin1
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY \('\r\\)n'
IGNORE 1 LINES;
```

---

## 🔍 Verification
Once the script executes completely, run the following query to verify that the rows loaded successfully:

```sql
SELECT COUNT(*) FROM superstore;
```
