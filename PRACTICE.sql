-- Active: 1731759726794@@127.0.0.1@3306@movies_data


USE practice;

CREATE TABLE employees (  
    employee_id INT PRIMARY KEY ,
    first_name VARCHAR (64),
    last_name VARCHAR(64),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);
--Were in decimal data type the maximum digits for the variable is 5 and max decimal places is 2--

--we can also rename our table using 
--RENAME TABLE employees TO workers ;--

ALTER TABLE employees
ADD phone_number VARCHAR (15);

ALTER TABLE employees
RENAME COLUMN phone_number TO email;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);
-- Changing the condition for a given column--

ALTER TABLE employees 
MODIFY email VARCHAR(100)
AFTER last_name;
--Moving the email column up --

ALTER TABLE employees
DROP COLUMN email;
--Removing the email column--

INSERT INTO employees     
VALUES (1, "Eugene","Crabs",20.1,"2023-01-02"),
(2,"Squidward","Tentacles",10.1,"2023-04-24"),
(3,"Patrick","Star",3.1,"2023-10-10"),
(4,"Sandy","Bucket",19.1,"2023-07-19");

--we can also specify the rows we want to insert data into here--



-----------------SELECT SYNTAX------------------------------------
--To select specific data from the table , we can select specific columns--
SELECT last_name, first_name
FROM employees;

--If we are looking for something specific, we use the where query --
SELECT * 
FROM employees
WHERE employee_id = 3;

SELECT * 
FROM employees
WHERE first_name = "Eugene";

SELECT * 
FROM employees
WHERE hourly_pay >= 7.0;

--Where something those not equal to something else 
SELECT * 
FROM employees
WHERE employee_id != 3;

-------UPDATING DATA IN A TABLE -----------------
UPDATE employees
SET hourly_pay = 30.1
WHERE employee_id = 3;
--To update all the rows at once we remove the where clause and all the data will be updated at once


-------------------CREATING A SAFE POINT IN THE DATABASE FOR OUR CODE-----------------
SET 
AUTO COMMIT =  OFF;
--WE USE THE COMMIT CLAUSE--------
COMMIT;
--So since we created the safe point we can roll back the previous statement to the check point
ROLLBACK;


SELECT * FROM employees;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE products(
    product_id INT,
    product_name VARCHAR (64),
    price DECIMAL (4,2)
);

ALTER TABLE products
ALTER price 
SET DEFAULT 0;

--We created a constraint to have the default value of price as 0 dollars--

ALTER TABLE products
ADD CONSTRAINT PRIMARY KEY (product_id); 

INSERT INTO products
VALUES (100,"straw", 2.0),
    (101,"napkin",4.8),
    (102,"fork",2.1),
    (103,"bag",5.9),
    (104,"spoon",2.9);


INSERT INTO products(product_id,product_name)
VALUES (105,"jet"),
        (106,"liker"),
        (107,"shoe");

SELECT * FROM products;


```
-----------------------DEFAULT CONSTRAINT ILLUSTRATION----------------------
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY,
    amount DECIMAL (5,2),
    transaction_date DATETIME DEFAULT NOW()
);


INSERT INTO transactions(transaction_id,amount)
VALUES (1,4.99),
    (2, 2.89),
    (3,8.37);


SELECT * FROM transactions;

DROP TABLE transactions;
```


CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY,
    amount DECIMAL (5,2)
);

INSERT INTO transactions
VALUES (1001,4.99),
    (1002, 2.89),
    (1003,8.37);

SELECT amount
FROM transactions
WHERE transaction_id =1003;

--------------------------------------------------FOREIGN KEYS------------------------------

CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT ,
    first_name VARCHAR(64),
    last_name  VARCHAR (64)
);

SELECT * FROM customers;

INSERT INTO customers (first_name,last_name)
VALUES ("Larry ","Johnson"),
    ("John","Mamprewuga"),
    ("Kenneth"," Micheal");


INSERT INTO customers(first_name,last_name)
VALUES( "Poofy","Damn");

--let me first drop transactions and then recreate it and add the foreign key constraint ------
DROP TABLE transactions;

CREATE TABLE transaction(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL (5,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Illustrating how the auto increment feature works
ALTER TABLE transaction
AUTO_INCREMENT = 1000;

INSERT INTO transaction(amount,customer_id)
VALUES (5.99,3),
    (2.89,1),
    (4.21, 3),
    (10.99,2);


--Customizing the name of our foreign key--
ALTER TABLE transaction
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

INSERT INTO transaction(amount, customer_id)
VALUES (1.00,NULL);

SELECT * FROM transaction;

----------------------------------------------CREATE A VIEW-----------------------------------------
SELECT * FROM employees;

CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;

SELECT * FROM employee_attendance
ORDER BY last_name;

SELECT * FROM customers;

ALTER TABLE customers
ADD COLUMN email VARCHAR(50);


UPDATE customers
SET email = "Keks@email.com"
WHERE customer_id = 1;

UPDATE customers
SET email = "Mugoya@gmail.com"
WHERE customer_id = 2;

UPDATE customers
SET email = "likeme@gmail.com"
WHERE customer_id = 3;

UPDATE customers
SET email = "qqquuu@gmail.com"
WHERE customer_id = 4;

UPDATE customers
SET email = "kkiin@gmail.com"
WHERE customer_id = 5;

UPDATE customers
SET email = "22hsd@gmail.com"
WHERE customer_id = 6;


CREATE VIEW customer_emails AS
SELECT email 
FROM customers;

SELECT * FROM customer_emails;
SELECT * FROM customers;


INSERT INTO customers(first_name,last_name,email)
VALUES ("Eugene","Pearl","likethat@gmail.com");



CREATE VIEW personal_info AS x
SELECT last_name, email,first_name
FROM customers
WHERE customer_id = 6;

SELECT * FROM personal_info;


-------------------------------------JOINS ---------------------
-------INTER JOINS 
SELECT * 
FROM transaction INNER JOIN customers
ON transaction.customer_id = customers.customer_id;
--SQL selects all rows that have matching ids
--we can also select specific columns 
SELECT transaction_id,amount,first_name,last_name
FROM transaction INNER JOIN customers
ON transaction.customer_id = customers.customer_id;

--------LEFT JOIN
--Displays everything from the table on the left
SELECT * 
FROM transaction LEFT JOIN customers
ON transaction.customer_id = customers.customer_id;

---------RIGHT
------Displays everything from the table on the right
SELECT * 
FROM transaction RIGHT JOIN customers
ON transaction.customer_id = customers.customer_id;



----------------------------------------FUNCTIONS-------------
---COUNT 
SELECT COUNT(amount) AS TODAYS_TRANSACTIONS
FROM  transaction;

-----SUM
SELECT SUM(amount) as SUM
FROM transaction;

-----CONCATINATE
SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees;

----------------------------------------LOGICAL OPERATORS
--These are key words used to combine more than one condition 

ALTER TABLE employees
ADD COLUMN  Job VARCHAR (25) AFTER hourly_pay;

UPDATE employees
SET Job = "manager"
WHERE employee_id = 1;

UPDATE employees
SET Job = "assistant_manager"
WHERE employee_id = 4;

UPDATE employees
SET Job = "cashier"
WHERE employee_id = 2;

UPDATE employees
SET Job = "cook/customer"
WHERE employee_id = 3;




SELECT * FROM employees;
































