-- Create the Database:
CREATE DATABASE StudentCourseManagement;

-- Create the Students Table:
CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_of_birth DATE
);


-- Create the Courses Table:
CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT
);


-- Create the Instructors Table:
CREATE TABLE Instructors (
    instructor_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


-- Create the Enrollments Table:
CREATE TABLE Enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


-- Insert Students Data:
INSERT INTO Students (first_name, last_name, email, date_of_birth) VALUES
('kirolos', 'magdy', 'kirolosmagdy@gmail.com', '2003-02-28'),
('ahmed', 'nabil', 'ahmednabil@gmail.com', '2000-11-22'),
('omar', 'nouh', 'omarnouh@gmail.com', '2002-06-15'),
('ahmed', 'hassan', 'ahmedhassan@gmail.com', '2003-03-08'),
('mazen', 'ahmed', 'mazenahmed@gmail.com', '1999-09-19'),
('madonna', 'daniel', 'madonnadaniel@gmail.com', '2004-01-10'),
('farah', 'mohamed', 'farahmohamed@gmail.com', '2000-07-25'),
('mario', 'nabil', 'marionabil@gmail.com', '2001-05-30'),
('arsany', 'noshy', 'arsanynoshy@gmail.com', '2002-12-20'),
('mina', 'medhat', 'minamedhat@gmail.com', '1998-10-05');


-- Insert Courses Data:
INSERT INTO Courses (course_name, course_description) VALUES
('python', 'Introduction to python'),
('SQL', 'Introduction to SQL'),
('machine learning', 'Introduction to machine learning'),
('AI', 'Advanced AI'),
('data engineering', 'Introduction to data engineering');


-- Insert Instructors Data:
INSERT INTO Instructors (first_name, last_name, email) VALUES
('ahmed', 'azab', 'ahmedazab@gmail.com'),
('fady', 'maged', 'fadymaged@gmail.com'),
('passant', 'mohamed', 'passantmohamed@gmail.com');

-- Insert Enrollments Data:
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-08-01'),
(2, 1, '2023-08-02'),
(3, 2, '2023-08-03'),
(4, 3, '2023-08-04'),
(5, 4, '2023-08-05'),
(6, 5, '2023-08-06'),
(7, 1, '2023-08-07'),
(8, 2, '2023-08-08'),
(9, 3, '2023-08-09'),
(10, 4, '2023-08-10'),
(1, 5, '2023-08-11'),
(2, 2, '2023-08-12'),
(3, 4, '2023-08-13'),
(4, 5, '2023-08-14'),
(5, 1, '2023-08-15');

-- Select all students:
SELECT * FROM Students;

-- Select all courses:
SELECT * FROM Courses;

-- Select all enrollments with student names and course names:
SELECT e.enrollment_id, s.first_name, s.last_name, c.course_name, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;


-- Select students who enrolled in a specific course:
SELECT s.student_id , s.first_name , s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'python';


-- Select courses with more than 5 students:
SELECT c.course_name , c.course_id
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) > 5;


-- Update a student's email:
UPDATE Students
SET email = 'kirolosmagdy10@gmail.com.com'
WHERE student_id = 1;


-- Delete a course that no students are enrolled in:
DELETE FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);


-- Calculate the average age of students:
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;


-- Find the course with the maximum enrollments:
SELECT TOP 1 c.course_name,c.course_id, COUNT(e.student_id) AS enrollment_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC;


-- List courses along with the number of students enrolled:
SELECT c.course_name,c.course_id, COUNT(e.student_id) AS num_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


-- Select all students with their enrolled courses:
SELECT s.student_id,s.first_name, s.last_name, c.course_name , c.course_id
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;



-- List all instructors and their courses:
SELECT i.first_name, i.last_name, c.course_name , c.course_id
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.course_id;



-- Find students who are not enrolled in any course:
SELECT s.student_id,s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- Select students enrolled in more than one course:
SELECT s.student_id,s.first_name, s.last_name 
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;


-- Find courses taught by a specific instructor:
SELECT c.course_name , c.course_id
FROM Courses c
JOIN Instructors i ON c.course_id = i.instructor_id
WHERE i.first_name = 'ahmed' AND i.last_name = 'azab';


-- Select the top 3 students with the most enrollments:
SELECT TOP 3 s.student_id,s.first_name, s.last_name, COUNT(e.enrollment_id) AS enrollments_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY enrollments_count DESC , student_id ASC;


-- Use UNION to combine results of two different SELECT queries:
SELECT first_name, last_name FROM Students
UNION
SELECT first_name, last_name FROM Instructors;


-- Create a stored procedure to add a new student:
CREATE PROCEDURE AddStudent
    @first_name VARCHAR(50), 
    @last_name VARCHAR(50), 
    @email VARCHAR(100), 
    @dob DATE
AS
BEGIN
    INSERT INTO Students (first_name, last_name, email, date_of_birth)
    VALUES (@first_name, @last_name, @email, @dob);
END;

-- test the procedure:
EXEC AddStudent 
@first_name = 'peter', @last_name = 'george',@email= 'petergeorge@gmail.com' , @dob = '2000-11-22';



-- Create a function to calculate the age of a student:
CREATE FUNCTION CalculateAge(@dob DATE)
RETURNS INT
AS
BEGIN
    DECLARE @age INT;
    SET @age = DATEDIFF(YEAR, @dob, GETDATE());
    IF (MONTH(GETDATE()) < MONTH(@dob) OR (MONTH(GETDATE()) = MONTH(@dob) AND DAY(GETDATE()) < DAY(@dob)))
    BEGIN
        SET @age = @age - 1;
    END
    RETURN @age;
END;


-- test the function:
SELECT dbo.CalculateAge('1990-01-15') AS Age;


-- Calculate the total number of students:
SELECT COUNT(*) AS total_students FROM Students;


-- Calculate the average, minimum, and maximum number of enrollments per course:
SELECT AVG(num_enrollments) AS average_enrollments, 
       MIN(num_enrollments) AS minimum_enrollments, 
       MAX(num_enrollments) AS maximum_enrollments
FROM (SELECT COUNT(*) AS num_enrollments FROM Enrollments GROUP BY course_id) AS enrollments_per_course;


-- Create aliases for complex column names:
SELECT c.course_name AS 'Course Name', COUNT(e.student_id) AS 'Number of Students Enrolled'
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


-- Use CASE to categorize students based on their age:
SELECT first_name, last_name, 
       CASE 
           WHEN dbo.CalculateAge(date_of_birth) < 18 THEN 'Minor'
           WHEN dbo.CalculateAge(date_of_birth) BETWEEN 18 AND 24 THEN 'Young Adult'
           ELSE 'Adult'
       END AS AgeGroup
FROM Students;


-- Use EXISTS to find courses with at least one enrolled student:
SELECT course_name
FROM Courses c
WHERE EXISTS (SELECT 1 FROM Enrollments e WHERE e.course_id = c.course_id);


-- Create comments in SQL for clarity:
-- This query selects all students with their enrolled courses
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;
