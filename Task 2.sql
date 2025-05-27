-- TASK 2



CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);


INSERT INTO student_table VALUES
(1, 'Alice', 'Engineering', 'alice@mail.com', 1234567890, 'New York', '2000-01-01', 'Female', 'Computer Science', 8.5, 'A'),
(2, 'Bob', 'Engineering', 'bob@mail.com', 2345678901, 'Chicago', '1999-05-10', 'Male', 'Mechanical', 6.7, 'B'),
(3, 'Charlie', 'Arts', 'charlie@mail.com', 3456789012, 'LA', '2001-02-20', 'Male', 'History', 4.2, 'C'),
(4, 'Diana', 'Science', 'diana@mail.com', 4567890123, 'Seattle', '1998-12-12', 'Female', 'Biology', 9.1, 'A'),
(5, 'Evan', 'Engineering', 'evan@mail.com', 5678901234, 'Boston', '2000-03-03', 'Male', 'Electrical', 5.9, 'B'),
(6, 'Fiona', 'Arts', 'fiona@mail.com', 6789012345, 'Miami', '1999-11-22', 'Female', 'Psychology', 3.5, 'C'),
(7, 'George', 'Science', 'george@mail.com', 7890123456, 'Dallas', '2001-07-15', 'Male', 'Chemistry', 4.8, 'C'),
(8, 'Hannah', 'Engineering', 'hannah@mail.com', 8901234567, 'Houston', '1997-09-09', 'Female', 'Civil', 7.3, 'B'),
(9, 'Ian', 'Science', 'ian@mail.com', 9012345678, 'Phoenix', '1998-06-25', 'Male', 'Physics', 6.0, 'B'),
(10, 'Julia', 'Arts', 'julia@mail.com', 1123456789, 'San Diego', '2000-10-30', 'Female', 'Philosophy', 9.5, 'A');


SELECT * FROM student_table
ORDER BY Grade DESC;



SELECT * FROM student_table
WHERE Gender = 'Male';


SELECT * FROM student_table
WHERE GPA < 5.0;

UPDATE student_table
SET email_id = 'newcharlie@mail.com',
    Grade = 'B'
WHERE Student_id = 3;


SELECT 
    Stu_name,
    DATE_PART('year', AGE(Date_of_birth)) AS Age
FROM student_table
WHERE Grade = 'B';

SELECT 
    Department,
    Gender,
    AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

ALTER TABLE student_table
RENAME TO student_info;


SELECT Stu_name
FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);