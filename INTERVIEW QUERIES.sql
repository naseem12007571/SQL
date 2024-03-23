-- Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
  SELECT SUBSTRING(FIRST_NAME, 1, 3)  FROM Student;
Write a SQL query to find the position of alphabet (‘a’) int the first name column ‘Shivansh’ from Student table.
--SELECT INSTR(FIRST_NAME, 'a') FROM Student WHERE FIRST_NAME = 'Shivansh'; 
