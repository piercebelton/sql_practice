SELECT *
FROM employee
WHERE title = 'Teller' AND start_date < '2007-01-01';
-- returns employees with teller title who also started before jan 1 2007

SELECT *
FROM employee
WHERE title = 'Teller' OR start_date < '2007-01-01';
-- returns all employees who either have the teller title OR started before jan 1 2007

SELECT *
FROM employee
WHERE end_date IS NULL
  AND (title = 'Teller' OR start_date < '2007-01-01');
-- returns all emplyees whose end date is NULL AND who are either a teller or started before jan 1 2007

SELECT *
FROM employee
WHERE end_date IS NULL
  AND NOT (title = 'Teller' OR start_date < '2007-01-01');
-- returns all employees whose end date is null and who are neither a teller nor started before jan 1 07

SELECT *
FROM employee
WHERE title != 'Teller' AND start_date >= '2007-01-01'
-- returns same result as above, but in much more readable terms

SELECT pt.name AS product_type, p.name AS product
FROM product AS p INNER JOIN product_type AS pt
  ON p.product_type_cd = pt.product_type_cd
WHERE pt.name = 'Customer Accounts';
-- returns all products that have the type "Customer Accounts"

SELECT pt.name AS product_type, p.name AS product
FROM product AS p INNER JOIN product_type AS pt
  ON p.product_type_cd = pt.product_type_cd
WHERE pt.name <> 'Customer Accounts';
-- returns opposite of above, all products that are NOT "Customer Accounts" <> is also !=

DELETE
FROM account
WHERE status = 'closed' AND YEAR(close_date) = 2002;
-- deletes all accounts closed in 2002

SELECT emp_id, fname, lname, start_date
FROM employee
WHERE start_date < '2007-01-01';
-- returns the 4 columns selected for all employees hired before jan 1 2007

SELECT emp_id, fname, lname, start_date
FROM employee
WHERE start_date < '2007-01-01'
  AND start_date >= '2005-01-01';
-- returns the 4 columns selected for all employees hired between the dates provided

SELECT emp_id, fname, lname, start_date
FROM employee
WHERE start_date BETWEEN '2007-01-01' AND '2005-01-01';
-- returns same as above, but a little more readable

SELECT account_id, product_cd, cust_id, avail_balance
FROM account
WHERE avail_balance BETWEEN 3000 and 5000;
-- selects columns above for accounts with balances between 3k and 5k

SELECT cust_id, fed_id
FROM customer
WHERE cust_type_cd = "I"
  AND fed_id BETWEEN '500-00-0000' AND '999-99-9999';
-- selects all customers whose socials fall between above values

SELECT account_id, product_cd, cust_id, avail_balance
FROM account
WHERE product_cd = "CHK" OR product_cd = 'SAV'
  OR product_cd = "CD" OR product_cd = 'MM';
-- selects columns at top from accounts whose product_cd is any of the four values listed

SELECT account_id, product_cd, cust_id, avail_balance
FROM account
WHERE product_cd IN ('CHK', 'SAV', 'CD', 'MM');
-- does the same as above, but a bit more readable

SELECT account_id, product_cd, cust_id, avail_balance
FROM account
WHERE product_cd IN (SELECT product_cd FROM product
  WHERE product_type_cd = 'ACCOUNT');
-- same as last two queries, but uses a sub-query to find the 4 account types

SELECT account_id, product_cd, cust_id, avail_balance
FROM account
WHERE product_cd NOT IN ('CHK', 'SAV', 'CD', 'MM');
-- returns 4 columns for accounts that do not have a product cd of the 4 values listed

SELECT emp_id, fname, lname
FROM employee
WHERE LEFT(lname, 1) = 'T';
-- returns all employees whose last names start with T

SELECT lname
FROM employee
WHERE lname LIKE '_a%e%';
-- returns all employees whose last names are like the above... using wildcard characters. _ replaces one character (allows for any values) % replaces any number of characters

F% Search strings beginning with F

%t Search strings ending with t

%bas% search for substring "bas"

__t_ search for 4 digit strings with the third character being "t"

___-__-____ search for strings with 3 digits - 2 digits - 4 digits eg social security #

SELECT cust_id, fed_id
FROM customer
WHERE fed_id LIKE '___-__-____';
-- returns customer fed ids that match social security format

SELECT emp_id, fname, lname
FROM employee
WHERE lname LIKE 'F%' OR lname LIKE 'G%';
-- returns employees whose last names start with F or G

SELECT emp_id, fname, lname
FROM employee
WHERE lname REGEXP '^[FG]';
-- same as above, using regex

SELECT emp_id, fname, lname, superior_emp_id
FROM employee
WHERE superior_emp_id IS NULL;
-- returns all employees who dont have a boss

SELECT emp_id, fname, lname, superior_emp_id
FROM employee
WHERE superior_emp_id = NULL;
-- fails because nothing ever equals NULL

SELECT emp_id, fname, lname, superior_emp_id
FROM employee
WHERE superior_emp_id IS NOT NULL;
-- opposite of 2 above, returns all employees that have a boss

SELECT emp_id, fname, lname, superior_emp_id
FROM employee
WHERE superior_emp_id != 6;
-- returns all employees that dont work for Helen Fleming... almost.

SELECT emp_id, fname, lname, superior_emp_id
FROM employee
WHERE superior_emp_id != 6 OR superior_emp_id IS NULL;
-- returns all employees that dont work for Helen Fleming... actually. Watch for NULL!

-- Exercise 4-1
1, 2, 3, 5, 6, 7 Txn_ids returned

-- Exercise 4-2
4, 9

-- Exercise 4-3
SELECT *
FROM account
WHERE YEAR(open_date) = 2002;

-- Exercise 4-4
SELECT *
FROM individual
WHERE lname LIKE '_a%e%';














buffer
