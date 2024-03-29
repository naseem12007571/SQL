CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 
 SELECT *FROM Title;
 
    -- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case. --
    SELECT UPPER (FIRST_NAME) from worker;
 
     -- 3 Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
     Select distinct DEPARTMENT from Worker; 
 
      -- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
     SELECT substring(FIRST_NAME,1,3) FROM worker;
  
     -- Q5 Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table-- 
      SELECT INSTR(FIRST_NAME,'b') FROM worker WHERE FIRST_NAME="Amitabh";
  
      -- Q6 removing white spaces from the right side.
      SELECT RTRIM(FIRST_NAME) FROM worker;

     -- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
      SELECT distinct DEPARTMENT,length(DEPARTMENT) from worker ;

     -- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
      SELECT replace(FIRST_NAME, 'a','A')  from Worker;

      -- 10 Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.--
      SELECT concat(FIRST_NAME,' ', LAST_NAME) AS Complete_name FROM worker;

      -- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
      SELECT * FROM worker order by FIRST_NAME asc; 
 
       -- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
       SELECT * FROM worker order by FIRST_NAME asc, DEPARTMENT desc; 
    
       -- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
        SELECT * FROM worker where FIRST_NAME In ('Vipul','Satish');
       
   --   Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
       SELECT * FROM worker where FIRST_NAME NOT In ('Vipul','Satish');
       
        -- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
         SELECT * FROM worker where DEPARTMENT like 'Admin%';
        
        --  Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
        SELECT * FROM worker where FIRST_NAME LIKE  '%a%';
       
        -- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
        SELECT * FROM worker where FIRST_NAME LIKE  '%a';
       
       -- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
          SELECT * FROM worker where FIRST_NAME like '_____h';
          
          -- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
          SELECT * from worker where SALARY between 100000 and 500000;
          
          -- Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.
          SELECT * FROM worker where year(joining_date)= 2021 and month(joining_date)=2;
          
          -- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
             select DEPARTMENT, count(*) from worker where DEPARTMENT = 'admin';
             
		  -- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
          SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary FROM worker 
		  WHERE Salary BETWEEN 50000 AND 100000;
          
          --  second method  alies name dena acha lagta h jaise upper diya h  as worker_name
         SELECT concat(FIRST_NAME, ' ', LAST_NAME), salary from worker
         where salary between 50000 and 100000;
         
         --  Q-23. Write an SQL query to fetch the number of workers for each department in descending order.
       SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
       FROM worker 
       GROUP BY DEPARTMENT 
       ORDER BY No_Of_Workers DESC;
       
      -- Q-24. Write an SQL query to print details of the Workers who are also Managers.
		   SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
           FROM Worker W
           INNER JOIN Title T
           ON W.WORKER_ID = T.WORKER_REF_ID
		   AND T.WORKER_TITLE in ('Manager');
           
	-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
    SELECT worker_title, count(*)  from title 
    group by worker_title having count(*)>1;  
    
    -- Q 26. Write an SQL query to show only odd rows from a table.
    select * from worker where mod(worker_id, 2) !=0;
    
    -- Q-27. Write an SQL query to show only even rows from a table.
     select * from worker where mod(worker_id, 2) =0;
     
  -- Q-30. Write an SQL query to show records from one table that another table does not have.
  SELECT * FROM Worker
   MINUS;
   SELECT * FROM Title;

 -- Q-31. Write an SQL query to show the current date and time.
     SELECT CURDATE();
     
-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT * FROM worker order by salary desc limit 10; 

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
     SELECT * FROM worker order by salary desc limit 4,1;    -- 5th highest salary agayi
     
   -- Second max salary
SELECT MAX(salary) from worker 
where salary not in  (SELECT MAX(salary) from worker) ;

  -- maxi salary 
SELECT max(salary) from worker;

     -- MAXI SALARY DEPARTMENT WISE 
     SELECT DEPARTMENT, MAX(salary) from worker group by department;
     
     -- Q-39. Write an SQL query to fetch the first 50% of records from a table.
    SELECT *
    FROM WORKER
	WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);
    
--  Q-40. Write an SQL query to fetch the departments that have less than five people in them.
select DEPARTMENT, count(worker_id) as number_count from worker group by DEPARTMENT HAVING count(worker_id) <5;

-- Q-42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM worker where worker_id= (SELECT min(worker_id) from worker);

-- Q 44 Q-44. Write an SQL query to fetch the last five records from a table.
 (SELECT * from worker order by worker_id desc  limit 5) order by worker_Id;
 
 -- Q-45. Write an SQL query to print the names of employees having the highest salary in each department.
(SELECT  max(salary) as maxisalry, department from worker group by department );


-- imortant queries 
-- Q-46. Write an SQL query to fetch three max salaries from a table
-- first method use of limit keyboard
SELECT distinct salary  FROM worker order by salary desc limit 3; 

 -- second method 
 SELECT distinct salary from worker w1
 where 3>= (select count(distinct salary) from worker w2 
 where w1.salary <= w2.salary )  order by w1.salary desc;
 
 -- Q-47. Write an SQL query to fetch three min salaries from a table.
 
 SELECT distinct salary from worker  w1
 where 3>= (select count(distinct salary) from worker w2
 where  w1.salary>=w2.salary ) order by w1.salary desc;
 
 -- Q-48. Write an SQL query to fetch nth max salaries from a table.
 SELECT distinct salary from worker w1
 where n >= (select count(distinct salary) from worker w2 
 where w1.salary <= w2.salary )  order by w1.salary desc;
 
 -- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 SELECT department , sum(salary) from worker group by department order by department desc;
 
 -- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
 SELECT first_name, salary from worker where salary =(select max(salary) from worker);
 
 
 
 
 








  


     
     
	
    
     
       
	         
       
       
         
       

    
 




 
 
 
