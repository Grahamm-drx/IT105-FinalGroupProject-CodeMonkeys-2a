CREATE DATABASE student_management_systemDB;
USE student_management_systemDB;

-- USERS
CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'staff') NOT NULL
);

-- STUDENTS
CREATE TABLE students (
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INSTRUCTORS
CREATE TABLE instructors (
    instructorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- COURSES
CREATE TABLE courses (
    courseID INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(100),
    instructorID INT,
    FOREIGN KEY (instructorID) REFERENCES instructors(instructorID)
);

-- ENROLLMENTS
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    courseID INT,
    enrollmentDate DATE,
    grade VARCHAR(5),

    FOREIGN KEY (studentID) REFERENCES students(studentID),
    FOREIGN KEY (courseID) REFERENCES courses(courseID)
);

-- AUDIT LOG
CREATE TABLE audit_logs (
    logID INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(50),
    tableName VARCHAR(50),
    actionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);