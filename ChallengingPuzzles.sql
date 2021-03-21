--Required Tables: students, student_enrollment.
--Write a query that finds students who do not take CS180.
SELECT *
FROM students
WHERE student_no NOT IN (SELECT student_no
						FROM student_enrollment
						WHERE course_no = 'CS180');
									
--Write a query to find students who take CS110 or CS107 but not both.
SELECT s.student_no, s.student_name, s.age 
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
GROUP BY s.student_no, s.student_name, s.age 
HAVING SUM(CASE WHEN se.course_no IN ('CS110', 'CS107')
		  THEN 1 ELSE 0 END) = 1;

--Write a query to find students who take CS220 and no other courses.
SELECT s.*
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
AND s.student_no NOT IN (SELECT student_no
						FROM student_enrollment
						WHERE course_no != 'CS220')

--Write a query that finds those students who take at most 2 courses. 
--Your query should exclude students that don't take any courses as well as those that take more than 2 course.
SELECT s.student_no, s.student_name, s.age, COUNT(se.course_no)
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
GROUP BY s.student_no, s.student_name, s.age
HAVING COUNT(se.course_no) <= 2;

--Write a query to find students who are older than at most two other students.
SELECT s.*
FROM students s
WHERE 2 >= (SELECT COUNT(*)
		   FROM students s2
		   WHERE s2.age < s.age)

