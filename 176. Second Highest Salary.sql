# Write your MySQL query statement below

SELECT MAX(salary) as SecondHighestSalary from Employee
WHERE salary not in (SELECT MAX(salary) from Employee)

