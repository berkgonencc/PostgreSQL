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


				