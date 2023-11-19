-- •	List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT
    E.EMP_NO,
    E.LAST_NAME,
    E.FIRST_NAME,
    E.SEX,
    S.SALARY
FROM
    EMPLOYEES E
    INNER JOIN SALARIES S
    ON E.EMP_NO = S.EMP_NO;

-- •	List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    HIRE_DATE LIKE "%/%/1986";

-- •	List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT
    DS.DEPT_NO,
    DS.DEPT_NAME,
    DM.EMP_NO,
    E.LAST_NAME,
    E.FIRST_NAME
FROM
    DEPT_MANAGER DM
    INNER JOIN DEPARTMENTS DS
    ON DM.DEPT_NO = DS.DEPT_NO
    INNER JOIN EMPLOYEES E
    ON E.EMP_NO = DM.EMP_NO;

-- •	List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT
    DE.DEPT_NO,
    E.EMP_NO,
    E.LAST_NAME,
    E.FIRST_NAME,
    D.DEPT_NAME
FROM
    EMPLOYEES   E
    INNER JOIN DEPT_EMP DE
    ON E.EMP_NO = DE.EMP_NO
    INNER JOIN DEPARTMENTS D
    ON D.DEPT_NO = DE.DEPT_NO;

-- •	List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT
    FIRST_NAME,
    LAST_NAME,
    SEX
FROM
    EMPLOYEES
WHERE
    FIRST_NAME = "Hercules"
    AND LAST_NAME LIKE "B%";

-- •	List each employee in the Sales department, including their employee number, last name, and first name (2 points)
-- Version 1
SELECT
    E.EMP_NO,
    LAST_NAME,
    FIRST_NAME
FROM
    EMPLOYEES E
    INNER JOIN DEPT_EMP DE
    ON E.EMP_NO = DE.EMP_NO
WHERE
    DEPT_NO = "d007";

-- Version 2
SELECT
    E.EMP_NO,
    LAST_NAME,
    FIRST_NAME
FROM
    EMPLOYEES   E
    INNER JOIN DEPT_EMP DE
    ON E.EMP_NO = DE.EMP_NO
    INNER JOIN DEPARTMENTS D
    ON D.DEPT_NO = DE.DEPT_NO
WHERE
    DEPT_NAME = "Finance";

-- •	List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT
    E.EMP_NO,
    FIRST_NAME,
    LAST_NAME,
    DEPT_NAME
FROM
    EMPLOYEES   E
    INNER JOIN DEPT_EMP DE
    ON E.EMP_NO = DE.EMP_NO
    INNER JOIN DEPARTMENTS D
    ON DE.DEPT_NO = D.DEPT_NO
WHERE
    DEPT_NAME IN ("Development", "Sales");

-- •	List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT
    LAST_NAME,
    COUNT(LAST_NAME) AS AMOUNT
FROM
    EMPLOYEES
GROUP BY
    LAST_NAME
ORDER BY
    (LAST_NAME) DESC;