CREATE DATABASE college;
USE college;


CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR (50),
marks INT  NOT NULL,
grade VARCHAR(1),
city VARCHAR (20)
);

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(11,'naseem',215,'C','dhakiya'),
(12,'khan',200,'B','dhakiya'),
(13,'arafat',211,'e','pune'),
(15,'mohsin',216,'f','delhi'),
(19,'abdulha',201,'A','rampur');

SELECT * FROM student where marks between 210 and 220;
SELECT * FROM student where city in ("delhi", "rampur");   -- USE FOR JAISE HUME DELHI OT RAMPUR KE STUDENT DEKHNE H ES KE LIYE EK TARAHA SE MATCHING KARNA
SELECT * FROM student where city NOT in ("delhi", "rampur");   -- ES mein reverse hoga aise student ayange jo es city ke ander nhi rahte h
SELECT marks FROM student;
SELECT max(marks)  FROM student;
SELECT avg(marks)  FROM student;
SELECT min(marks)  FROM student;
SELECT count(name)  FROM student;

SELECT city From student GROUP BY city;              
SELECT city, count(name)  From student GROUP BY city;         -- har kise city mein kitne student count kar ke dega kitne student h kaha kaha ke

SELECT city , avg(marks)                                     -- city wise average of student 
from student 
group by city  
order by city, avg (marks) desc;                    

select grade,count(rollno)           -- kitne student ko c garde mile kitno ko b mile we can check like it
from student
group by grade;

select city,count(rollno)
from student
group by city
having max(marks)>210;            -- un student ka data jin ke marks 210 se uuper h having ka group ke uuper conditon ke liye hota h

UPDATE student   -- update grade o to where A is present
SET grade ="O"
WHERE grade = "A";
SELECT * FROM student;

UPDATE student       -- here we have  a update the marks of rollno 12
SET marks = 212
WHERE rollno=12;

UPDATE student
SET grade ="B"
WHERE marks between 212 AND 220;    -- jitne bhi student ke marks between 212 to 220 unhe grade b milna chiaye update ho na chahye
SELECT * from student;

UPDATE student               -- jaise hume student ke discripcency ke marks up date karne h sab ke 2 2
SET marks=marks + 2 ;        

ALTER TABLE student          -- kuch new data coloum add karna chahate ho
ADD COLUMN age INT ;

ALTER TABLE student          
DROP COLUMN age ;					-- drop column mtlb delete karna chahae h column
SELECT * from student;

ALTER TABLE student                --   add a column 
ADD column age INT NOT NULL DEFAULT 19;      

truncate student;                                                  -- DROP puri table delete karta  AND TRUNCATE TABLE KE DATA KO DELET KARTA H

ALTER TABLE student
CHANGE NAME full_name VARCHAR(100);    -- WE CAN CHANGE THR NAME OF COLUMN 
SELECT * from student;

DELETE FROM student
where marks < 80 ;                     -- ager kise ke marks 80 se kaam h to delete ho jayange

-- inner join use for same data both table mean data that is overleap  COMMAN DATA
-- inner join give a common data bitween two table

CREATE TABLE student2(
id INT PRIMARY KEY,
name VARCHAR(100)
);

INSERT INTO student2(id, name)
VALUES
(101,"naseem"),
(102,"raza"),
(103,"imran");

CREATE TABLE course (
id INT PRIMARY KEY,
course VARCHAR (100)
);

INSERT INTO course(id, course)
VALUES
(104, "English"),
(103,"math"),
(102,"physics"),
(105,"chemistry");

SELECT * from course;
select * from student2;


-- INNER JOIN
SELECT * 
FROM student2
INNER JOIN course
on student2 .id=  course.id;

 -- second method we can write short name 
SELECT * 
FROM student2 as s
INNER JOIN course  as c
on s.id= c.id;

-- LEFT JOIN 
SELECT * 
FROM student2 as s
LEFT JOIN course  as c
on s.id= c.id;

-- right join
SELECT * 
FROM student2 as s
RIGHT JOIN course  as c
on s.id= c.id;

-- full join ke liye dono left and right and unin ka mix kar ke full join banta h
SELECT * 
FROM student2 as s
LEFT JOIN course  as c
on s.id= c.id
UNION
SELECT * 
FROM student2 as s
RIGHT JOIN course  as c
on s.id= c.id;
                 
                 -- LEFT EXCLUSIVE JOIN
-- JAB hume shirf left data chahiye a table ka and b ka overleap data jo ata h wo nhi chaiye to aise karange only left part ke liye 
-- WHERE KA USE HOGA OR JIS TABLE KA OVERLAP DATA NHI LENA YSKA NAME AYEGA BS 
SELECT * 
FROM student2 as s
LEFT JOIN course  as c
on s.id= c.id
WHERE  c.id IS NULL;


-- RIGHT EXCLUSIVE JOIN  SAME UPPER KI TARHA H
SELECT * 
FROM student2 as s
RIGHT JOIN course  as c
on s.id= c.id
WHERE  s.id IS NULL;


-- self join ke liye ye table banaya h
-- self join ek khud ki table ka common data jo h use nikale ke liye karte h jo match hota h single table mein

CREATE TABLE employe(
id INT PRIMARY KEY,
name  VARCHAR (100),
manager_id INT 

);


INSERT INTO employe
(id, name, manager_id )
VALUES
(101, "naseem", 103),
(102, "raza", 104),
(103, "abdullha", NULL),
(104, "Mohsin", 103);

select * FROM employe;

SELECT *
FROM employe as a
JOIN employe as b
on a.id = b.manager_id;

-- union 
-- union use to combine the data both set of table and give the unique recod value remove the duplicate the values
-- uninon use should have same number of colums colum much have similar data type and column every select should be in same  order 
-- name ka union liya h
SELECT name FROM employe
union  
SELECT name FROM employe ;

-- union all give the all duplicate values 
SELECT name FROM employe
union  all
SELECT name FROM employe ;

-- sub queries ke liye niche tabal create
CREATE TABLE student1 (
 rollno INT primary key,
 name  VARCHAR (100),
 mark INT 
);

INSERT INTO student1
(rollno, name, mark)
VALUES
(10, "naseem", 30),
(11, "waseem", 38),
(12, "imran", 39),
(13, "raza", 45),
(17, "virat", 33);

SELECT * FROM student1;

-- no we will use sub queries
SELECT AVG(mark)
FROM student1;

-- Who  student  marks is greater than avg
SELECT name, mark
FROM student1
WHERE mark>37.0000;

-- now we will use sub queries ka matlab hota h dynamic matbl 
-- jaise kabhi avg kam bhi ho sakta h jyda bhi ho sakta koi new studen aye to us case automatic change  ke liye sub querise use karte h
SELECT name, mark
FROM student1
WHERE mark> (SELECT AVG(mark) FROM student1);

-- print the  marks even roll no
SELECT name, rollno
FROM student1
WHERE rollno %2=0;













  
  















							   














