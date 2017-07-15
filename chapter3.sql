SELECT emp_id, fname, lname
FROM employee
WHERE lname = 'Bkadfl';
-- returns empty set because no employees have the last name 'Bkadfl'

SELECT fname, lname
FROM employee;
-- returns all employee first and last names

SELECT *
FROM department;
-- returns all columns from department table

SELECT dept_id, name
FROM department;
-- same as above, since there are only those two columns in department table

SELECT
  emp_id,
  'ACTIVE',
  emp_id * 3.14159,
  UPPER(lname)
FROM employee;
-- returns employee IDs, ACTIVE status, emp_id * pi, and last names uppercase'd

SELECT VERSION(),
       USER(),
       DATABASE();
-- shows mysql version, user currently connected, and DB currently in use, requires no "FROM" clause, unlike normal queries. This is because it uses only built in functions and accesses no table at all

SELECT
  emp_id,
  'ACTIVE' AS status,
  emp_id * 3.14159 AS empid_x_pi,
  UPPER(lname) AS last_name_upper
FROM employee;
-- same as 2 queries above, but aliases the columns so the table headers make more sense.

SELECT cust_id
FROM account;
-- selects all customer IDs from active accounts, however, shows duplicates

SELECT DISTINCT cust_id
FROM account;
-- fixes the above issue, by not displaying repeating results.

SELECT e.emp_id, e.fname, e.lname
FROM (SELECT emp_id, fname, lname, start_date, title
      FROM employee) AS e;
-- subquery table e

CREATE VIEW employee_vw AS
SELECT emp_id, fname, lname,
  YEAR(start_date) AS start_year
FROM employee;
-- simply creates a virtual table you can query, with the year employees started taken from employee start date, table called employee_vw

SELECT emp_id, start_year
FROM employee_vw
-- queries the view created above

SELECT employee.emp_id,
       employee.fname,
       employee.lname,
       department.name AS dept_name
FROM employee INNER JOIN department
  ON employee.dept_id = department.dept_id;
-- joins tables to display employee department names by referencing the dept_id column on employee table and department table.

SELECT e.emp_id, e.fname, e.lname, d.name AS dept_name
FROM employee AS e INNER JOIN department as d
  ON e.dept_id = d.dept_id
-- simplified using AS statements to assign variable names. Same query as above.

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller';
-- selects the 5 columns from the employee table of employees who have the title "head teller"

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller'
  AND start_date > '2002-01-01';
-- selects the 5 columns from the employee table of employees who have the title "head teller", | AND | who started AFTER jan 1 2002

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE title = 'Head Teller'
  OR start_date > '2002-01-01';
--selects the 5 columns from the employee table of employees who have title "head teller" | OR | started after jan 1 2002. OR statements specify only that the results must match ONE of the conditions, AND statements mean results must match ALL criteria

SELECT emp_id, fname, lname, start_date, title
FROM employee
WHERE (title = 'Head Teller' AND start_date > '2002-01-01')
  OR (title = 'teller' AND start_date > '2002-01-01');
-- in this query, the results must meet either SET of TWO conditions, "head teller AND started after 1-1-02" OR "teller AND started after 1-1-02"

SELECT d.name, count(e.emp_id) AS num_employees
FROM department AS d INNER JOIN employee AS e
  ON d.dept_id = e.dept_id
GROUP BY d.name
HAVING count(e.emp_id) > 2;
-- returns a count of employees in each department with greater than two employees

SELECT open_emp_id, product_cd
FROM account
ORDER BY open_emp_id, product_cd;
-- returns all accounts ordered by the employees that opened them, and then by the type of accounts. Col1 is sorted, then col2, keeping col 1 results sorted.

SELECT account_id, product_cd, open_date, avail_balance
FROM account
ORDER BY avail_balance DESC;
-- shows four columns selected, rows sorted by balance, descending (highest first)

SELECT cust_id, cust_type_cd, city, state, fed_id
FROM customer
ORDER BY RIGHT(fed_id, 3);
-- returns 5 columns sorted by last 3 of the fed_id column

SELECT emp_id, title, start_date, fname, lname
FROM employee
ORDER BY 2, 5;
-- sorts by column #2 and then column #5 in order of the SELECT statement

-- Exercise 3-1
SELECT emp_id, fname, lname
FROM employee
ORDER BY lname, fname;

-- Exercise 3-2
SELECT account_id, cust_id, avail_balance
FROM account
WHERE status = 'ACTIVE'
  AND avail_balance > 2500;

-- Exercise 3-3
SELECT DISTINCT open_emp_id
FROM account;

-- Exercise 3-4
SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product AS p INNER JOIN account as a
  ON p.product_cd = a.product_cd
WHERE p.product_type_cd = 'ACCOUNT'
ORDER BY p.product_cd, a.cust_id;















buffer
