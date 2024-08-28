## Student Course Management System
# Overview
The Student Course Management System project is designed to manage student courses using a SQL-based database. This guide will walk you through installing SQL Server Management Studio (SSMS) and setting up the database with the provided SQL queries.

# Installation Guide
# Step 1: Install SQL Server Management Studio (SSMS) 
SQL Server Management Studio (SSMS) is a free, integrated environment for managing any SQL infrastructure, from SQL Server to Azure SQL Database.

# Download SSMS:

Visit the official Microsoft SSMS download page.
Click on the "Download SQL Server Management Studio (SSMS)" link.

# Install SSMS:

Once downloaded, run the installer SSMS-Setup-ENU.exe.
Follow the on-screen instructions to complete the installation.

# Launch SSMS:

After installation, open SSMS from the Start Menu or desktop shortcut.
Connect to your SQL Server instance by entering your server name and authentication method.

# Step 2: Set Up the Student Course Management Database

# Open the SQL Queries File:

Clone or download this repository to your local machine.
Locate the SQL file containing all the queries (e.g., StudentCourseManagement.sql).

# Open the SQL File in SSMS:

Open SSMS and connect to your SQL Server instance.
In SSMS, go to File > Open > File… and select the StudentCourseManagement.sql file from your local directory.

# Execute the SQL File:

Once the file is open in SSMS, you will see all the SQL queries required to set up the database and tables.
Click on the "Execute" button (or press F5) to run the script. This will create the database, tables, and insert sample data as outlined in the project.

# Verify the Database and Tables:

In the Object Explorer pane on the left side of SSMS, expand the Databases node to see the newly created StudentCourseManagement database.
Expand the StudentCourseManagement database node to view all tables, including Students, Courses, Instructors, and Enrollments.

# Features
Database Setup: Create a structured database to manage students, courses, instructors, and enrollments.

Table Creation: Define tables with appropriate data types and constraints to maintain data integrity.

Data Insertion: Insert sample data into the tables to simulate a real-world scenario.

Basic and Advanced SQL Queries: Perform various SQL operations to manipulate and retrieve data effectively.

Stored Procedures and Functions: Implement stored procedures and functions to automate repetitive tasks and perform calculations.

Data Aggregation and Analysis: Use aggregate functions and grouping to analyze data within the database.


# 1. Database Setup
Create a database: Set up a new database named StudentCourseManagement to store all related tables and data.

# 2. Table Creation
Students Table: Create a table to store student information including ID, name, email, and date of birth.

Courses Table: Create a table to store course details including course ID, name, and description.

Instructors Table: Create a table to manage instructor details such as ID, name, and email.

Enrollments Table: Create a table to track student enrollments in courses, linking students to courses through foreign keys.

# 3. Insert Sample Data

Populate the database with sample data:

10 students with their personal details.

5 courses covering different subjects.

3 instructors who teach various courses.

15 enrollments to represent student-course registrations.

# 4. Basic Queries

Retrieve all students: Select all records from the Students table to view student information.

Retrieve all courses: Select all records from the Courses table to view course details.

Retrieve enrollments with student and course names: Join tables to list enrollments along with corresponding student and course names.

# 5. Advanced Queries

Find students enrolled in a specific course: Use SQL queries to filter students based on course enrollment.

List courses with more than 5 students: Use aggregate functions and filtering to identify popular courses.

Update a student's email: Perform an update operation to modify student details.

Delete courses with no enrollments: Use subqueries to identify and remove courses that have no students enrolled.

Calculate the average age of students: Use SQL functions to calculate demographic statistics.

Find the course with the maximum enrollments: Use aggregation and sorting to determine the most popular course. 

List courses along with the number of students enrolled: Group data to provide insights into course popularity.

# 6. Join Queries

List all students with their enrolled courses: Use JOIN operations to merge data from multiple tables.

List all instructors and their courses: Join tables to show which courses are taught by each instructor.

Find students not enrolled in any course: Use LEFT JOIN to identify students with no course registrations.

# 7. Subqueries and Set Operations

Find students enrolled in more than one course: Use subqueries to filter students based on multiple enrollments.

Find courses taught by a specific instructor: Use subqueries or joins to filter courses by instructor.

Select the top 3 students with the most enrollments: Use ranking functions to identify top-performing students.

Combine results from different queries: Use UNION to merge data from different queries.

# 8. Functions and Stored Procedures

Stored Procedure to Add a New Student: Create a stored procedure to simplify the process of adding new students to the database.

Function to Calculate Student Age: Develop a function to compute a student's age based on their date of birth.

# 9. Aggregate Functions and Grouping

Calculate the total number of students: Use COUNT to find the total student population.

Calculate average, minimum, and maximum enrollments per course: Use aggregate functions to analyze course data.

# 10. Additional Tasks

Create Aliases: Simplify complex SQL statements by using column aliases.

Categorize Students by Age: Use the CASE statement to group students into different age categories.

Check for Course Enrollments: Use EXISTS to verify if there are students enrolled in specific courses.

Add SQL Comments: Include comments in SQL scripts for better readability and understanding.

