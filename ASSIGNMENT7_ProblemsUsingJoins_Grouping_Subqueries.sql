--Assignment Instructions: 
--The tables are: students, courses, student_enrollment, professors, and teach. The following problems are related to these.

--Are the tables student_enrollment and professors directly related to each other? Why or why not?
--NO THEY ARE NOT DIRECTLY RELATED EACH OTHER BECAUSE THEY DO NOT HAVE COMMON COLUMN SHARED AMONGST THEM.

--Write a query that shows the student's name, the courses the student is taking and the professors that teach that course. 
SELECT student_name, se.course_no, pr.last_name
FROM students st INNER JOIN student_enrollment se
ON st.student_no = se.student_no
INNER JOIN teach te ON se.course_no = te.course_no
INNER JOIN professors pr ON te.last_name = pr.last_name
ORDER BY student_name;

--If you execute the query from the previous answer, you'll notice the student_name and the course_no is being repeated. Why is this happening?
--Students are related many courses and, courses are related different professors. You'll clearly be able to see that multiple professors are teaching the same subject.

--In question 3 you discovered why there is repeating data. How can we eliminate this redundancy? 
--Let's say we only care to see a single professor teaching a course and we don't care for all the other professors 
--that teach the particular course. Write a query that will accomplish this so that every record is distinct.
SELECT student_name, course_no, MIN(last_name) as professor
FROM (SELECT student_name, se.course_no, pr.last_name
FROM students st INNER JOIN student_enrollment se
ON st.student_no = se.student_no
INNER JOIN teach te ON se.course_no = te.course_no
INNER JOIN professors pr ON te.last_name = pr.last_name) a
GROUP BY student_name, course_no
ORDER BY student_name, course_no;

--Why are correlated subqueries slower that non-correlated subqueries and joins?
--They are slower because a correlated subquery is run for every single record of the outer query.On the other hand, non-correlated subquery will execute once in the beginning.

--In the video lectures, we've been discussing the employees table and the departments table.
--Considering those tables, write a query that returns employees whose salary is above average for their given department.
SELECT first_name
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees e1 WHERE e1.department = e.department);

--Write a query that returns ALL of the students as well as any courses they may or may not be taking. 
SELECT st.student_no, student_name, course_no
FROM students st LEFT JOIN student_enrollment se
ON st.student_no = se.student_no;











