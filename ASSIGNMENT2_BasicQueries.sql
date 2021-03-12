create table students
(
	student_no integer,
	student_name varchar(20),
	age integer
);

insert into students values (1, 'Michael', 19);
insert into students values (2, 'Doug', 18);
insert into students values (3, 'Samantha', 21);
insert into students values (4, 'Pete', 20);
insert into students values (5, 'Ralph', 19);
insert into students values (6, 'Arnold', 22);
insert into students values (7, 'Michael', 19);
insert into students values (8, 'Jack', 19);
insert into students values (9, 'Rand', 17);
insert into students values (10, 'Sylvia', 20);

-- Write a query to display the names of those students that are between the ages of 18 and 20.
SELECT student_name
FROM students
WHERE age BETWEEN 18 AND 20;

--Write a query to display all of those students that contain the letters "ch" in their name 
--or their name ends with the letters "nd".
SELECT *
FROM students
WHERE student_name like '%ch%'
OR student_name like '%nd';

--Write a query to display the name of those students that have the letters "ae" or "ph" in their name 
--and are NOT 19 years old.
SELECT student_name
FROM students
WHERE (student_name like '%ae%'
OR student_name like '%ph%')
AND age != 19;

--Write a query that lists the names of students sorted by their age from largest to smallest.
SELECT student_name
FROM students
ORDER BY age DESC;

--Write a query that displays the names and ages of the top 4 oldest students.
SELECT student_name, age
FROM students
ORDER BY age DESC
LIMIT 4;

--Write a query that returns students based on the following criteria:
--The student must not be older than age 20 if their student_no is either between 3 and 5 or
--their student_no is 7. Your query should also return students older than age 20 
--but in that case they must have a student_no that is at least 4.
SELECT *
FROM students
WHERE age <= 20 
AND (student_no BETWEEN 3 AND 5 OR student_no = 7)
OR (age > 20 AND student_no >= 4);
