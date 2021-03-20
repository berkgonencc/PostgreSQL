--Correlated Subqueries Exercise
--Find max and min salary for each department.

SELECT a.department, a.first_name, a.salary,
CASE WHEN salary = (SELECT max(salary) FROM employees e WHERE a.department = e.department) THEN 'HIGHEST SALARY'
	 WHEN salary = (SELECT min(salary) FROM employees e WHERE a.department = e.department) THEN 'LOWEST SALARY'
	 END salary_in_department
FROM (SELECT department, first_name, salary
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2 WHERE e1.department = e2.department)
OR salary = (SELECT MIN(salary) FROM employees e2 WHERE e1.department = e2.department)
ORDER BY department) a;