

--  webiste where i have done this type of question https://www.edureka.co/blog/interview-questions/sql-query-interview-questions
CREATE DATABASE Company ;
Use Company;

-- table one 
CREATE TABLE EmployeeInfo(
EmpID INT PRIMARY KEY,
EmpFname VARCHAR(100),
EmpSecName VARCHAR(120),
Department VARCHAR(10),
Project VARCHAR (12),
Address VARCHAR(120),
DOB DATETIME,
GENDER VARCHAR(2)
);
    --  table two 
CREATE TABLE  EmployeePosition(
EmpId INT PRIMARY KEY,
EmpPosition VARCHAR(50),
Dateofjoin DATETIME,
SALARY  INT (100)
);


-- table one insert 
INSERT INTO EmployeeInfo 
(EmpId, EmpFname, EmpSecName, Department, Project, Address, DOB, GENDER)
VALUES
(1, "Sanjay", "Mehra", "HR", "P1", "Hyderabad", '1976-12-01', 'M'),
(2, "Ananya", "Mishra", "Admin", "P2", "Delhi", '2000-06-02', 'F'),
(3, "Rohan", "Diwan", "Account", "P3", "Mumbai", '1976-07-07', 'M'),
(4, "Sonia", "Kulkrani", "HR", "P1", "Hyderabad", '1996-11-09', 'F'),
(5, "Ankit", "Kapoor", "Admin", "P2", "Delhi", '1956-11-01', 'M');

-- table two insert
INSERT INTO EmployeePosition (EmpId, EmpPosition, Dateofjoin, Salary)
VALUES
(1, "Manager", '2002-05-01', 50000),
(2, "Executive", '1999-07-10', 75000),
(3, "Manager", '1897-04-11', 90000),
(4, "Executive", '2002-06-03', 85000),
(5, "Led", '2002-05-08', 300000);

UPDATE EmployeePosition 
set salary = 50000
WHERE EmpId= 4;



SELECT * FROM EmployeePosition;
SELECT* FROM EmployeeInfo;



-- Write a query to fetch the EmpFname from the EmployeeInfo table 
-- in the upper case and use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) AS nameofemployee FROM EmployeeInfo;

-- Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(*) FROM EmployeeInfo
WHERE Department = "HR";


-- Write a query to get the current date.
SELECT SYSTDATE();

-- Write a query to retrieve the first four characters of  
-- Empsename from the EmployeeInfo table.

SELECT substring(EmpSecName,1,4) from employeeInfo;
SELECT LEFT(EmpSecName,4) from employeeInfo;   -- second method

-- Write q query to find all the employees whose salary is between 50000 to 100000.

SELECT  * from  employeePosition
WHERE salary BETWEEN 50000 AND 100000;

--  Write a query to find the names of employees that begin with ‘S’
SELECT * FROM employeeInfo WHERE EmpFname like "S%";

-- Q13. Write a query to fetch details of employees whose EmpLname
--  ends with an alphabet ‘A’ and contains five alphabets.
SELECT * FROM EmployeeInfo where EmpFname like "___a";


-- Write a query to fetch top N records.

SELECT * from  employeePosition ORDER BY  salary DESC LIMIT 2;
SELECT DISTINCT Salary FROM employeePosition ORDER BY Salary DESC LIMIT 3;  -- distinct salary ke liye copy nhi ayagi

-- maximum salary
SELECT MAX(salary) FROM employeePosition;         -- aggregate function ke sath distinct use nhi karte kiyo ki wo single value lete h

-- second maximum
SELECT MAX(salary) from employeePosition
WHERE Salary NOT IN (SELECT MAX(salary) from employeePosition);

-- OR
SELECT MAX(salary) from employeePosition
WHERE Salary < (SELECT MAX(salary) from employeePosition);


-- print first name and last name 
SELECT CONCAT(EmpFname, ' ', EmpSecname) AS 'FullName' FROM EmployeeInfo;

-- Write a query to fetch details of employees 
-- whose Empscename ends with an alphabet ‘A’ and contains five alphabets.
SELECT * FROM EmployeeInfo WHERE EmpSecName LIKE '____a';

-- start with a and contain five alphabets
SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'a____';


-- Write a query to fetch details of all employees excluding the employees 
-- with first names, “Sanjay” and “Sonia” from the EmployeeInfo table

SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ("Sanjay","Sonia");

-- Write a query to fetch details of employees with the address as “DELHI(DEL)”.
SELECT * FROM EmployeeInfo WHERE Address LIKE '%Delhi%';
SELECT * FROM EmployeeInfo WHERE Address = 'Delhi';

-- 17q Write a query to fetch the department-wise count of employees 
-- sorted by department’s count in ascending order.

SELECT department, COUNT(EmpId) AS EmpCount
FROM employeeInfo
GROUP BY department
ORDER BY EmpCount ASC;

-- Q18. Write a query to calculate the even and odd records from a table.
SELECT *
FROM employeeInfo
WHERE EmpId % 2 = 0;

-- for odd 
SELECT *
FROM employeeInfo
WHERE EmpId % 2 =1;


-- Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
-- we can find max first and second and third and soon like first 1-1= or second 2-1 or third 3-1 



SELECT distinct Salary
FROM EmployeePosition E1
WHERE 2-1= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition E2 WHERE E2.Salary > E1.Salary);


-- we can find min  and second min third min   E2.SALARY<E1.SALARY THIS WILL BE CHANGE

SELECT distinct Salary 
From EmployeePosition E1
WHERE 1-1 = (SELECT COUNT(distinct Salary) FROM EmployeePosition E2 WHERE  E2.Salary <E1.Salary );
-- we can find like mini
SELECT min(salary) from EmployeePosition;


-- Write a query to find duplicate records from a table.
SELECT Department
FROM EmployeeInfo
GROUP BY Department
HAVING COUNT(Department) > 1;

-- or we can search like that duplicate recod emid ya empfname ya department duplicate hoga to ajaygea 
SELECT EmpID, EmpFname, Department ,COUNT(*) 
FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department 
HAVING COUNT(*) > 1;

-- write a sql queries to first name or last name of employee
SELECT CONCAT(EmpFname, '  ', EmpSecName) as 'FULL NAME 'from EmployeeInfo;


-- Write a query to display the first and the last record from the EmployeeInfo table.
-- WE got first record here
SELECT * FROM EmployeeInfo
order by empId ASC
LIMIT 1;

-- we got the last recoder here 
SELECT * FROM EmployeeInfo
order by empId  DESC
LIMIT 1;

-- Write a query to fetch 50% records from the EmployeeInfo table.
SELECT * FROM EmployeeInfo 
WHERE EmpId <= (select count(EmpId)/2 from EmployeeInfo);










    











































































