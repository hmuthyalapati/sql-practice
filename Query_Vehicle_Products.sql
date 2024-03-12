SELECT COUNT(*) FROM classicmodels.productlines;

SELECT * FROM classicmodels.productlines;

SELECT COUNT(*) FROM classicmodels.products;

SELECT * FROM classicmodels.products;

SELECT productLine FROM classicmodels.products;
SELECT DISTINCT productLine FROM classicmodels.products;

SELECT COUNT(p.productCode), productLine FROM classicmodels.products p
GROUP BY productLine;

SELECT COUNT(p.productCode), productLine FROM classicmodels.products p
GROUP BY productLine
-- ORDER BY productLine -- by default order is by ascending
-- ORDER BY productLine ASC
ORDER BY productLine DESC 
;

SELECT COUNT(p.productCode), productLine FROM classicmodels.products p
GROUP BY productLine HAVING COUNT(p.productCode) > 10;

-- ***************************************
-- Section 1. Querying data
-- SELECT FROM – show you how to use a simple SELECT FROM statement to query the data from a single table.
SELECT * FROM classicmodels.products;

-- SELECT – learn how to use the SELECT statement without referencing a table.
SELECT NOW();

SELECT sysdate();

-- ***************************************
-- Section 2. Sorting data
-- ORDER BY – show you how to sort the result set using the ORDER BY clause. You will also learn how to use custom sort order with the FIELD function.
SELECT * FROM classicmodels.customers c
ORDER BY contactFirstName DESC;
-- Yoshi, Wales, Susan, Rachel, Michael, Kelvin, Julie, Eric, Diego

-- WHERE – learn how to use the WHERE clause to filter rows based on specified conditions
SELECT * FROM classicmodels.customers c
WHERE contactFirstName IN ("Yoshi", "Wales", "Susan", "Rachel", "Michael", "Kelvin", "Julie", "Eric", "Diego")
ORDER BY contactFirstName DESC;

SELECT * FROM classicmodels.customers c
WHERE contactFirstName IN ("Michael", "Julie")
ORDER BY contactFirstName DESC, contactLastName DESC;

SELECT * FROM classicmodels.customers c
WHERE contactLastName IN ("Frick", "Donnermeyer", "Young", "Murphy", "King", "Brown")
-- ORDER BY contactFirstName DESC, contactLastName DESC
ORDER BY FIELD(contactLastName, "Frick", "Donnermeyer", "Young", "Murphy", "King", "Brown")
;

SELECT * FROM classicmodels.products
WHERE productLine="Planes";

-- SELECT DISTINCT – show you how to use the DISTINCT operator in the SELECT statement to eliminate duplicate rows in a result set.
SELECT DISTINCT country FROM classicmodels.offices;

-- AND – introduce you to the AND operator to combine Boolean expressions to form a complex condition for filtering data.
SELECT * FROM classicmodels.offices
WHERE country="USA" AND officeCode < 4;

-- OR– introduce you to the OR operator and show you how to combine the OR operator with the AND operator to filter data.
SELECT * FROM classicmodels.offices
WHERE country="USA" OR city="Sydney";

-- IN – show you how to use the IN operator in the WHERE clause to determine if a value matches any value in a set
SELECT * FROM classicmodels.customers c
WHERE contactLastName IN ("Frick", "Donnermeyer", "Young", "Murphy", "King", "Brown");

-- NOT IN – negate the IN operator using the NOT operator to check if a value doesn’t match any value in a set.
SELECT * FROM classicmodels.customers c
WHERE contactLastName NOT IN ("Frick", "Donnermeyer", "Young", "Murphy", "King", "Brown");

-- BETWEEN – show you how to query data based on a range using the BETWEEN operator.
SELECT * FROM employees
WHERE employeeNumber BETWEEN 1000 AND 1500;

-- LIKE  – query database on pattern matching using wildcards such as % and _.
SELECT * FROM employees
WHERE lastName LIKE "%l%";

-- LIMIT – use LIMIT to limit the number of rows returned by the SELECT statement
SELECT * FROM employees
LIMIT 5;

-- IS NULL – test whether a value is NULL or not by using the IS NULL operator.
SELECT * FROM employees
WHERE reportsTo IS NULL;

-- Section 4. Joining tables
-- Table & Column Aliases – introduce you to table and column aliases.
SELECT emp.employeeNumber AS en FROM classicmodels.employees emp;


-- Concat two or more values with a seperator (WS=With seperator)
SELECT CONCAT_WS(", ", lastName, firstName, email) "Full Name" FROM classicmodels.employees;

-- Joins  – give you an overview of joins supported in MySQL including inner join, left join, and right join
-- INNER JOIN – query rows from a table that has matching rows in another table.
-- Venn diagram intersection is the key
SELECT o.orderDate, od.quantityOrdered, od.priceEach FROM classicmodels.orders o
INNER JOIN classicmodels.orderdetails od ON o.orderNumber = od.orderNumber;

-- All tables should have something in common to be joined
SELECT c.customerName, p.customerNumber, o.orderNumber, o.orderDate, p.amount, od.quantityOrdered, od.priceEach
FROM classicmodels.orders o
INNER JOIN classicmodels.orderdetails od USING(orderNumber)
INNER JOIN classicmodels.customers c USING(customerNumber)
INNER JOIN classicmodels.payments p USING(customerNumber);
-- Using 

-- LEFT JOIN – return all rows from the left table and matching rows from the right table or null if no matching rows are found in the right table.
-- Displays entire left side and middle of venn diagram
 