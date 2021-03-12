create table professors
(
	last_name varchar(20),
	department varchar(12),
	salary integer,
	hire_date date
);

insert into professors values ('Chong', 'Science', 88000, '2006-04-18');
insert into professors values ('Brown', 'Math', 97000, '2002-08-22');
insert into professors values ('Jones', 'History', 67000, '2009-11-17');
insert into professors values ('Wilson', 'Astronomy', 110000, '2005-01-15');
insert into professors values ('Miller', 'Agriculture', 82000, '2008-05-08');
insert into professors values ('Williams', 'Law', 105000, '2001-06-05');


--Write a query against the professors table that can output the following in the result:
--"Chong works in the Science department"
SELECT last_name || ' works in the ' || department || ' department'
FROM professors;

--Write a SQL query against the professors table that would return the following result:
--"It is false that professor Chong is highly paid"
--"It is true that professor Brown is highly paid"
--"It is false that professor Jones is highly paid"
--"It is true that professor Wilson is highly paid"
--"It is false that professor Miller is highly paid"
--"It is true that professor Williams is highly paid"
--NOTE: A professor is highly paid if they make greater than 95000.
SELECT 'It is ' || (salary > 95000) || ' that professor ' || last_name || ' is highly paid'
FROM professors;

--Write a query that returns all of the records and columns from the professors table but 
--shortens the department names to only the first three characters in upper case.
SELECT last_name, UPPER(SUBSTRING(department, 1, 3)) as department, salary, hire_date
FROM professors;

--Write a query that returns the highest and lowest salary from the professors table excluding 
--the professor named 'Wilson'.
SELECT MAX(salary) as highest_sal, MIN(salary) as lowest_sal
FROM professors
WHERE last_name != 'Wilson';

--Write a query that will display the hire date of the professor that has been teaching the longest.
SELECT MIN(hire_date)
FROM professors;

