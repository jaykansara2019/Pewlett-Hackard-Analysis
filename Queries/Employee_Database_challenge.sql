
-- Deliverable 1: The Number of Retiring Employees by Title
-- Create retirement_titles table
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		tt.titles,
		tt.from_date,
		tt.to_date
-- INTO retirement_titles
From employees as e
Inner Join titles as tt
On (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
titles,
from_date,
to_date

-- INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, titles DESC;

-- Retiree title count by titles
SELECT COUNT(ut.titles), titles
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY ut.count DESC;

-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no)e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		tt.titles
-- INTO mentorship_eligibilty
From employees as e
Inner Join dept_emp as de
On (de.emp_no = e.emp_no)
INNER JOIN titles as tt
ON (tt.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;