-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_student (
    studentID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE dim_instructor (
    instructorID INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE dim_course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(100),
    instructorID INT
);

CREATE TABLE dim_date (
    dateID INT AUTO_INCREMENT PRIMARY KEY,
    fullDate DATE,
    year INT,
    month INT,
    day INT
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_enrollments (
    enrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    studentID INT,
    courseID INT,
    instructorID INT,
    dateID INT,
    grade VARCHAR(5),

    FOREIGN KEY (studentID) REFERENCES dim_student(studentID),
    FOREIGN KEY (courseID) REFERENCES dim_course(courseID),
    FOREIGN KEY (instructorID) REFERENCES dim_instructor(instructorID),
    FOREIGN KEY (dateID) REFERENCES dim_date(dateID)
);