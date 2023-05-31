
-- 1. To Create A New DataBase
  CREATE DATABASE  database_assignment;

-- 2. To Use DataBase
  USE database_assignment;

-- 3. To Create a Table
  CREATE TABLE  customers(
   FIRST_NAME VARCHAR(15) NOT NULL,
   LAST_NAME VARCHAR(50) NOT NULL,
   DATE_of_Birth DATE NOT NULL,
   Phone VARCHAR(15),
   Address VARCHAR(200) NOT NULL,
   City VARCHAR(200) NOT NULL,
   State VARCHAR(200) NOT NULL,
   Points INT NOT NULL
   );
   
-- Inserting Data to the Table
INSERT INTO customers(FIRST_NAME,LAST_NAME,DATE_of_Birth,Phone,Address,City,State,Points) VALUES
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA','2273'),

('Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA','947'),

('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),

('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),

('Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX','3675')
;

-- To Show Table and Data
SELECT * FROM customers;

-- 4.  Show only 2 members whose points are more than 1000.
  SELECT * FROM customers WHERE Points ORDER BY Points > 1000 DESC LIMIT 2;


-- 5. Find the customers whose age is from 1980 to 1990 or points less than 1000.
  SELECT * FROM customers WHERE Points <1000 OR DATE_of_Birth BETWEEN '1980-01-01' AND '1990-01-01';


-- 6. Order the customers by points in ascending order.
  SELECT * FROM customers ORDER BY Points;

-- 7. Find the customer whose name contains 'burgh' using a Regular Expression.
  SELECT * FROM customers WHERE LAST_NAME REGEXP 'burgh';

-- 8. Find a customer who does not have a phone number.
  SELECT * FROM customers WHERE Phone IS NULL;

-- 9.  Change the 'Date of Birth' column name to 'dob'.
  ALTER TABLE customers CHANGE COLUMN DATE_of_Birth dob DATE NOT NULL;

-- 10.  Find the max point holder customer name.
  SELECT * FROM customers WHERE Points = (SELECT MAX(Points) FROM customers);
 -- another way
 SELECT FIRST_NAME,LAST_NAME,Points FROM customers WHERE Points = (SELECT MAX(Points) FROM customers);

-- 11.  Execute a query for the following scenario.
	-- If customers have points less than 1000, they are bronze members.
	-- If customers have points of more than 1000 and less than 2000, they are silver members.
	-- If customers have points of more than 2000 and less than 3000, they are gold members.
	-- If customers have points of more than 3000, they are platinum members.
SELECT FIRST_NAME,LAST_NAME,points,
CASE
	WHEN Points<1000 THEN 'They are Bronze Members.'
	WHEN Points>=1000 AND Points<2000 THEN 'They are Silver Members.'
	WHEN Points>=2000 AND Points<3000 THEN 'They are Gold Members.'
	ELSE 'They are Platinum Members.'
END AS Membership FROM customers;