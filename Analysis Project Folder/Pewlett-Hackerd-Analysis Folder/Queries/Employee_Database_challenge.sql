--Start Deliverable 1
--Queries Employee_Database_challenge.sql
SELECT e.emp_no, e.first_name, e.last_name, t.title, t. from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
--filter on birth_date
WHERE (e.birth_date BETWEEN ('1951-01-01') and ('1955-12-31'))
ORDER BY e.emp_no;

--Using starter code
-- Use Dictinct with Orderby to remove duplicate rows
-- Retrieve employee number, first and last name, title columns 
-- from the Retirement Titles table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--Create retiring_titles
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY Count DESC;

-- End of Deliverable 1

-- Start of Deliverable 2
--Mentorship_elegibility 
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
--filter on to_date to get current employees ('9999-01-01')
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no

--END of Deliverable 2

-- START - 2 additional query for challenge summary section.
--query 1, retirement_info_by_departments
--Lis of departamental retirees

--Use Left Join for dept_emp and departments tables
SELECT 
    de.emp_no,
    de.to_date,
	de.dept_no,
	d.dept_name
INTO dept_emp_dept_name
FROM dept_emp as de
LEFT JOIN departments as d
ON de.dept_no = d.dept_no

--Use Left Join for unique_dept and dept_emp_dept_name tables
SELECT 
    ud.emp_no,
    ud.first_name,
    ud.last_name,
    ud.to_date,
	ud.dept_no,
	dn.dept_name
INTO unique_dept_name
FROM unique_dept as ud
LEFT JOIN dept_emp_dept_name as dn
ON ud.emp_no = dn.emp_no
WHERE ud.to_date = ('9999-01-01');

--create retiring_titles by dept
SELECT COUNT(udn.dept_name), udn.dept_name
INTO retiring_titles_dept
FROM unique_dept_name AS udn
GROUP BY udn.dept_name
ORDER BY Count DESC;

--query 2 - Create mentorship_elegibility by dept
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	udn.dept_name
INTO mentorship_eligibilty_dept
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN unique_dept_name as udn
	ON (de.dept_no = udn.dept_no)
--filter on to_date to get current employees ('9999-01-01')
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no

--create mentorship_retiring by dept
SELECT COUNT(mep.dept_name), mep.dept_name
INTO mentorship_retiring_dept
FROM mentorship_eligibilty_dept AS mep
GROUP BY mep.dept_name
ORDER BY Count DESC;
