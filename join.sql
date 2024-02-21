-- JOIN 

CREATE DATABASE collegeduniya;
USE collegeduniya;

CREATE TABLE student(
Id INT PRIMARY KEY,
Name VARCHAR (20)
);

INSERT INTO student (Id, Name)
VALUES
( 101, "Naseem Choudhary"),
(102, "Raza"),
(103, "anees");


CREATE TABLE Course(
id INT PRIMARY KEY,
course VARCHAR(100)
);

INSERT INTO Course(id,course)
VALUES
(106,"Math"),
(102,"English"),
(103,"biology"),
(104,"science"),
(105,"social science");

-- here i update 101 id to 106
UPDATE Course 
SET id= 106
WHERE id =101;

SELECT * FROM Course;
SELECT* FROM student;

-- now we will use inner join 

SELECT * FROM 
student as s -- alis  use nakhli name
INNER JOIN course as c   -- alias use c
on student.id= course.id;

-- so we can do like that it
SELECT * FROM
student as s 
INNER JOIN course as c
on s.id = c.id;             -- here we can use alias name 


-- left join 

SELECT * FROM 
Student AS A                -- first table left bali 
LEFT JOIN  course AS B
on A.Id = B.id;   

-- right join
SELECT * FROM 
Student AS A                     -- first table left bali 
RIGHT JOIN  course AS B
on A.id = B.id;   

-- full join

SELECT * FROM 
student AS A
LEFT JOIN course AS B 
On A.id= B.id
UNION
SELECT * FROM 
student AS A
RIGHT JOIN course AS B
ON A.id= B.id;

-- left exclusive join 

SELECT * FROM 
student AS A
left Join course AS b
on A.id= b.id
WHERE b.id IS NULL;

-- right exclusive join
SELECT * FROM 
student AS A 
right join Course AS b
on A.id= B.id
WHERE A.id IS NULL;
  
  --  union give the unique values
SELECT*FROM course
union
SELECT* FROM course;

-- union all give the duplicate values

SELECT * FROM course
union all
SELECT* FROM course












