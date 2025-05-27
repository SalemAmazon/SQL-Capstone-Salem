-- Create the tables

-- 1. StudentInfo Table
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME TEXT,
    DOB DATE,
    PHONE_NO TEXT,
    EMAIL_ID TEXT,
    ADDRESS TEXT
);

-- 2. CoursesInfo Table
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME TEXT,
    COURSE_INSTRUCTOR_NAME TEXT
);

-- 3. EnrollmentInfo Table
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS TEXT,
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);


-- StudentInfo Data
INSERT INTO StudentInfo VALUES 
(1, 'Alice', '2000-01-01', '1234567890', 'alice@example.com', 'New York'),
(2, 'Bob', '1999-02-15', '9876543210', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie', '2001-05-21', '5556667777', 'charlie@example.com', 'Chicago');

-- CoursesInfo Data
INSERT INTO CoursesInfo VALUES 
(101, 'Mathematics', 'Dr. Smith'),
(102, 'Biology', 'Dr. Johnson'),
(103, 'History', 'Dr. Williams');

-- EnrollmentInfo Data
INSERT INTO EnrollmentInfo VALUES 
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 2, 101, 'Not Enrolled'),
(4, 3, 103, 'Enrolled');



-- a)
SELECT 
    s.STU_NAME, 
    s.PHONE_NO, 
    s.EMAIL_ID, 
    e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID;


-- b)
SELECT 
    c.COURSE_NAME
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.STU_ID = 1 AND e.ENROLL_STATUS = 'Enrolled';


--c)
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;


--d)
SELECT * FROM CoursesInfo
WHERE COURSE_ID = 101;

--e)
SELECT * FROM CoursesInfo
WHERE COURSE_ID IN (101, 102);

--------- 4


--a)
SELECT 
    c.COURSE_NAME, 
    COUNT(*) AS total_enrolled
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_NAME;


--b)
SELECT s.STU_NAME
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
WHERE e.COURSE_ID = 103 AND e.ENROLL_STATUS = 'Enrolled';

--c)

SELECT 
    c.COURSE_INSTRUCTOR_NAME, 
    COUNT(*) AS student_count
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_INSTRUCTOR_NAME;

--d)
SELECT s.STU_NAME
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY s.STU_ID, s.STU_NAME
HAVING COUNT(*) > 1;


--e)
SELECT 
    c.COURSE_NAME, 
    COUNT(*) AS enrolled_count
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_NAME
ORDER BY enrolled_count DESC;
