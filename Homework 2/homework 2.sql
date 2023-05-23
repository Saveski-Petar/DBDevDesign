-- 1/6

SELECT *
FROM Employee 
WHERE FirstName = 'Antonio'

SELECT *
FROM Employee 
WHERE DateOfBirth > '01.01.1979'

SELECT *
FROM Employee 
WHERE Gender = 'M'

SELECT *
FROM Employee 
WHERE LastName LIKE 'T%'

SELECT *
FROM Employee
WHERE hiredate = '01.01.1988'

SELECT *
FROM Employee 
WHERE LastName LIKE 'J%'
      AND hiredate = '01.01.1988'

-- 2/6

SELECT *
FROM Employee 
WHERE FirstName = 'Antonio'
ORDER BY LastName 

SELECT *
FROM Employee
ORDER BY FirstName

SELECT *
FROM Employee
WHERE GENDER='M'
ORDER BY hiredate DESC


-- 3/6
SELECT region 
FROM BusinessEntity 
UNION ALL 
SELECT regionname
FROM Customer

SELECT region 
FROM BusinessEntity 
UNION  
SELECT regionname
FROM Customer

SELECT region 
FROM BusinessEntity 
INTERSECT 
SELECT regionname
FROM Customer


-- 4/6

-- The table exists without Data so i wil just alter it and add the CONSTRAINT
ALTER TABLE "Order"
ADD CONSTRAINT CHECK_OrderDate CHECK (OrderDate >= '01.01.2010');

-- CHECK IF IT EXIST IN THE TABLE 
SELECT constraint_name,constraint_type
FROM information_schema.table_constraints
WHERE table_name =  'Order'
		AND constraint_name = 'check_orderdate';


-- SAme table exists i will alter it 
ALTER TABLE Product
ADD CONSTRAINT CHECK_Price CHECK(price >= 1.2 * cost);

-- Becuse there is data in the product table already lets update the current price 

UPDATE Product
SET Price = 1.2 * cost 
WHERE Price <= 1.2 * cost

-- CHECK IF IT EXIST IN THE TABLE 
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'product'
	AND constraint_name = 'check_price';

-- 
CREATE TABLE IF NOT EXISTS Product (
Id serial PRIMARY KEY NOT NULL,
Code varchar(50) NULL,
Name varchar(100) NULL,
Description varchar(5000) NULL UNIQUE,
Weight float(2) NULL,
Price float(2) NULL CHECK(price >= 1.2 * cost),
Cost float(2) NULL);


-- 5/6
CREATE TABLE IF NOT EXISTS "Order" (
Id serial PRIMARY KEY NOT NULL,
OrderDate date NULL,
Status smallint NULL,
BusinessEntityId integer NULL REFERENCES BusinessEntity(id),
CustomerId integer NULL REFERENCES Customer(id) ,
EmployeeId integer NULL REFERENCES Employee(id),
TotalPrice float(2) NULL,
Comment varchar(500) NULL
);

ALTER TABLE "Order"
ADD CONSTRAINT order_businessentity_id_fkey FOREIGN KEY(businessentityid) REFERENCES businessentity(id);
ALTER TABLE "Order"
ADD CONSTRAINT order_customerid_fkey FOREIGN KEY(customerid) REFERENCES customer(id);
ALTER TABLE "Order"
ADD CONSTRAINT order_employeeid_fkey FOREIGN KEY(employeeid) REFERENCES employee(id);


CREATE TABLE IF NOT EXISTS OrderDetails (
Id serial PRIMARY KEY NOT NULL,
OrderId integer NULL REFERENCES "Order"(id),
ProductId integer NULL REFERENCES Product(id),
Quantity integer NULL,
Price float(2) NULL);

ALTER TABLE OrderDetails
ADD CONSTRAINT orderDetails_orderid_fkey FOREIGN KEY(orderid) REFERENCES "Order"(id);
ALTER TABLE OrderDetails
ADD CONSTRAINT orderDetails_productid_fkey FOREIGN KEY(productid) REFERENCES Product(id);



