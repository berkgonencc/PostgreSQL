--TABLES
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

create table courses
(
	course_no varchar(5),
	course_title varchar(20),
	credits integer
);

insert into courses values ('CS110', 'Pre Calculus', 4);
insert into courses values ('CS180', 'Physics', 4);
insert into courses values ('CS107', 'Intro to Psychology', 3);
insert into courses values ('CS210', 'Art History', 3);
insert into courses values ('CS220', 'US History', 3);

create table student_enrollment
(
	student_no integer,
	course_no varchar(5)
);

insert into student_enrollment values (1, 'CS110');
insert into student_enrollment values (1, 'CS180');
insert into student_enrollment values (1, 'CS210');
insert into student_enrollment values (2, 'CS107');
insert into student_enrollment values (2, 'CS220');
insert into student_enrollment values (3, 'CS110');
insert into student_enrollment values (3, 'CS180');
insert into student_enrollment values (4, 'CS220');
insert into student_enrollment values (5, 'CS110');
insert into student_enrollment values (5, 'CS180');
insert into student_enrollment values (5, 'CS210');
insert into student_enrollment values (5, 'CS220');
insert into student_enrollment values (6, 'CS110');
insert into student_enrollment values (7, 'CS110');
insert into student_enrollment values (7, 'CS210');



--Using subqueries only, write a SQL statement that returns the names of those students that are taking the courses Physics and US History.
SELECT student_name 
FROM students
WHERE student_no IN (SELECT student_no
FROM student_enrollment
WHERE course_no IN (SELECT course_no 
					FROM courses
				   WHERE course_title IN ('Physics', 'US History')));
				   
--Using subqueries only, write a query that returns the name of the student that is taking the highest number of courses.
SELECT student_name
FROM students
WHERE student_no = (SELECT student_no
FROM student_enrollment
GROUP BY student_no
ORDER BY count(*) desc
LIMIT 1);

--Answer TRUE or FALSE for the following statement:
--Subqueries can be used in the FROM clause and the WHERE clause but cannot be used in the SELECT Clause.
--FALSE.

--Write a query to find the student that is the oldest. You are not allowed to use LIMIT or the ORDER BY clause to solve this problem.
SELECT *
FROM students
WHERE age = (SELECT MAX(age) FROM students);


				