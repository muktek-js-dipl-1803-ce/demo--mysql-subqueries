
# 1 Write a query to find the name (FIRST_NAME, LAST_NAME) and the salary
#   of the employees who have a higher salary
#   than the employee whose LAST_NAME='Bull'. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE
  SALARY > (
    SELECT SALARY
    FROM Employees
    WHERE
      LAST_NAME = 'Bull'
  )
ORDER BY SALARY ASC;






# 2 Write a query to find the name (FIRST_NAME, LAST_NAME, DEPARTMENT_ID)
#   of all employees who works in the IT department.
#   Employees, Departments
#

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM Employees
WHERE
  DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID
    FROM Departments
    WHERE
      DEPARTMENT_NAME = 'IT'
  );


# 3 Write a query to find the name (FIRST_NAME, LAST_NAME), and salary of
#    the employees whose salary is greater than the average salary. Employees

SELECT FIRST_NAME, LAST_NAME, Salary
FROM Employees
WHERE
  Salary > (
    SELECT AVG(Salary)
    FROM Employees
  );


# 4 Write a query to find the name (FIRST_NAME, LAST_NAME), and MANAGER_ID
#   of the employees who are managers. Employees

SELECT FIRST_NAME, LAST_NAME, MANAGER_ID
FROM Employees
WHERE
  EMPLOYEE_ID IN(
    SELECT MANAGER_ID
    FROM Employees
  );



# 5 Write  a query to find the NAMEs departments that are based in the USA
     Departments, Locations

SELECT DEPARTMENT_NAME, LOCATION_ID
FROM Departments
WHERE
  LOCATION_ID IN (
    SELECT LOCATION_ID
    FROM Locations
    WHERE
      COUNTRY_ID = "US"
  );


# 6 Write a query to find the name (FIRST_NAME, LAST_NAME, Salary)
#   of the employees who work in a USA based department.
#   Employees, Departments, Locations

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM Employees
WHERE
  DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM Departments
    WHERE
      LOCATION_ID IN (
        SELECT LOCATION_ID
        FROM Locations
        WHERE
          COUNTRY_ID = 'US'
      )
  );

# 7 Write a query to find the name (FIRST_NAME, LAST_NAME), and salary
#   of the employees whose salary is equal to the minimum salary for their job.
#   Employees, Jobs

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM Employees
WHERE
  SALARY = (
    SELECT MIN_SALARY
    FROM Jobs
      WHERE
        JOB_ID = Employees.JOB_ID
  );


# 8 Write a query to find the name (FIRST_NAME, LAST_NAME), and salary
#    of the employees whose salary is greater than the average salary of all departments.
#    Employees


SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE
  SALARY > (
    SELECT AVG(the_avg)
    FROM (
      SELECT AVG(SALARY) the_avg
      FROM Employees
      GROUP BY DEPARTMENT_ID
    ) department_salaries
  )
ORDER BY SALARY ASC;





SELECT *
  FROM Employees


# 9 Write a query to find the name (FIRST_NAME, LAST_NAME), and salary
#   of the employees who earn the same salary as the minimum salary for all departments.
#   Employees, Departments

# 10 Write a query to find the name (FIRST_NAME, LAST_NAME), and salary
#    of the employees whose salary is greater than the average salary of all departments.
#    Employees
