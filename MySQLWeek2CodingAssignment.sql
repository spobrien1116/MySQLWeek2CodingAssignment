USE employees;
-- SELECT e.emp_no, e.birth_date, t.title FROM titles t
-- INNER JOIN employees e ON t.emp_no = e.emp_no WHERE e.birth_date > '1965-01-01';

SELECT COUNT(t.emp_no) AS "Employee Total", title AS "Job Title" FROM titles t
INNER JOIN employees e ON t.emp_no = e.emp_no WHERE e.birth_date > '1965-01-01'
GROUP BY t.title ORDER BY t.title;

-- SELECT titles.emp_no, titles.title, salaries.salary FROM employees.titles
-- INNER JOIN salaries WHERE titles.emp_no = salaries.emp_no;

SELECT FORMAT(AVG(s.salary), 2) AS "Average Salary", t.title AS "Job Title" FROM titles t
INNER JOIN salaries s ON t.emp_no = s.emp_no GROUP BY t.title ORDER BY t.title;

-- SELECT salaries.emp_no, salaries.salary, salaries.from_date, salaries.to_date FROM salaries
-- INNER JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
-- INNER JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
-- WHERE salaries.from_date >= '1990-01-01' AND salaries.to_date <= '1992-12-31';

SELECT FORMAT(SUM(s.salary), 2) AS "Total Spending", d.dept_name AS "Department" FROM salaries s
INNER JOIN dept_emp USING (emp_no)
INNER JOIN departments d USING (dept_no)
WHERE s.from_date >= '1990-01-01' AND s.to_date <= '1992-12-31' AND d.dept_no = 'd001';