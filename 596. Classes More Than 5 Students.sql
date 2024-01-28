# Write your MySQL query statement below

SELECT Class from courses
group by class having count(student)>=5;
