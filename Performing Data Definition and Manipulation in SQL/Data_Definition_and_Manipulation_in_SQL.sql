##########################################################
##########################################################

# Data Definition and Manipulation in SQL

##########################################################
##########################################################


#############################
-- Task Two: Data Definition
-- In this task, you will learn how to create database objects (tables) in the database you created in task 1.
#############################

-- Creating the sales table
CREATE TABLE sales(
	purchase_number INT PRIMARY KEY,
	date_of_purchase DATE NOT NULL,
	customer_id INT NOT NULL,
	item_code VARCHAR(10) NOT NULL
);

-- Creating the customers table
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email_address VARCHAR(255),
	number_of_complaints INT
);

-- Creating the items table
CREATE TABLE items(
	item_code VARCHAR(10) PRIMARY KEY,
	item VARCHAR(255),
	unit_price_usd DECIMAL(5,2),
	company_id INT,
	company_name VARCHAR(255) NOT NULL
);

#############################
-- Task Three: Data Manipulation
-- By the end of Task 3, you will be able to insert records into the tables created.
#############################

-- Insert five (5) records into the sales table
INSERT INTO sales (purchase_number, date_of_purchase, customer_id, item_code)
VALUES 
(1, '2020-05-28', 1, 'A11'),
(2, '2020-05-27', 2, 'B11'),
(3, '2020-05-27', 2, 'A12'),
(4, '2020-05-31', 3, 'C11'),
(5, '2020-05-31', 4, 'B12');

-- Insert five (5) records into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email_address, number_of_complaints)
VALUES 
(1, 'Olango', 'Honda', 'ohanda@email.com', 0),
(2, 'Mukesh', 'Sharma', 'msharma@email.uk', 2),
(3, 'Atul', 'Ishan', 'aishan@email.com', 1),
(4, 'Durga', 'Javal', 'djaval@email.com', 0),
(5, 'Eric', 'Jackson', 'ejackson@email.com', 5);

-- Insert five (5) records into the items table
INSERT INTO items (	item_code, item, unit_price_usd, company_id, company_name)
VALUES 
('A11', 'Flask', 12.50, 1, 'Company A'),
('A12', 'Lamp', 10, 1, 'Company A'),
('B11', 'Desk', 50, 2, 'Company B'),
('B12', 'Chair', 150, 2, 'Company B'),
('C11', 'Bicycle', 35.50, 3, 'Company C');

#############################
-- Task Four: Data Manipulation - Part 2
-- By the end of Task 4, you will be able to upload a csv file into your database 
-- and insert records into duplicate tables. 
#############################

-- Create the companies table and upload the CSV file into the table
CREATE TABLE companies (
	company_id INT PRIMARY KEY,
	company_name VARCHAR(255),
	headquarters_phone_number VARCHAR(20)
);

-- Create the sales_dup table
CREATE TABLE sales_dup(
	purchase_number INT PRIMARY KEY,
	date_of_purchase DATE NOT NULL,
	customer_id INT NOT NULL,
	item_code VARCHAR(10) NOT NULL
);

-- Create the customers_dup table
CREATE TABLE customers_dup(
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email_address VARCHAR(255),
	number_of_complaints INT
);

-- Insert records from sales table into sales_dup table
INSERT INTO sales_dup
SELECT * 
FROM sales;

-- Insert records from customers table into customers_dup table
INSERT INTO customers_dup
SELECT * 
FROM customers;


-- Create the companies_dup table
CREATE TABLE companies_dup(
	company_id INT PRIMARY KEY,
	company_name VARCHAR(255),
	headquarters_phone_number VARCHAR(20)
);

-- Insert records from companies table into companies_dup table
INSERT INTO companies_dup
SELECT * 
FROM companies;

#############################
-- Task Five: Data Definition and Manipulation
-- By the end of this task, you will be able to alter, rename and update data in tables in a database.
#############################

-- Add a new column gender after the last_name field
-- We will perform this task using ALTER on the customers_dup table
ALTER TABLE customers_dup
ADD COLUMN gender CHAR(2);

SELECT * 
FROM customers_dup;

-- Insert new records to the customers_dup table
INSERT INTO customers_dup (customer_id, first_name, last_name, email_address, number_of_complaints, gender)
VALUES 
(6, 'Isha', 'Hari', 'ihari@email.in', 2, 'M'),
(7, 'Susma', 'Mishra', 'smishra@email.com', 11, 'M');

-- Rename the sales_dup table to sales_data
ALTER TABLE sales_dup
RENAME TO sales_data;

-- Rename the unit_price_usd column in the items table to item_price
ALTER TABLE items
RENAME unit_price_usd TO item_price;

-- Update the first_name of the 6th record in the table.
UPDATE customers_dup
SET first_name = 'Ishita'
WHERE customer_id = 6

-- Update the gender of the 7th record in the table.
UPDATE customers_dup
SET gender = 'F'
WHERE customer_id = 6

#############################
-- Task Six: Drop Vs. Truncate Vs. Delete
-- By the end of task 6, you will learn how to use SQL drop, truncate and delete statements. 
-- In addition, you will understand the difference between SQL drop, truncate and delete statements.
#############################

-- DROP the customers_dup table
DROP TABLE customers_dup;

-- TRUNCATE the sales_data table
TRUNCATE TABLE sales_data;

-- DELETE records from the companies_data table
DELETE FROM companies_data
WHERE company_id = 4

















