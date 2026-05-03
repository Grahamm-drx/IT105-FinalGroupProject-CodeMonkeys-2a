
-- Original Query 1: Monthly enrollment counts by year
SELECT 
    YEAR(enrollmentDate) AS year,
    MONTH(enrollmentDate) AS month,
    COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY YEAR(enrollmentDate), MONTH(enrollmentDate)
ORDER BY year, month;

-- Original Query 2: Top courses by student enrollment
SELECT 
    c.courseName,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
GROUP BY c.courseName
ORDER BY total_students DESC;

-- Original Query 3: Top instructors by student enrollment
SELECT 
    i.name AS instructor_name,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
JOIN instructors i ON c.instructorID = i.instructorID
GROUP BY i.name
ORDER BY total_students DESC;

-- Original Query 4: Average students per course
SELECT 
    AVG(student_count) AS avg_students_per_course
FROM (
    SELECT 
        courseID,
        COUNT(studentID) AS student_count
    FROM enrollments
    GROUP BY courseID
) AS course_counts;

-- Original Query 5: Courses with more than 5 students
SELECT 
    c.courseName,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
GROUP BY c.courseName
HAVING COUNT(e.studentID) > 5
ORDER BY total_students DESC;

-- Optimized Queries --
-- Optimized Query 1: Monthly enrollment counts by year
SELECT 
    YEAR(enrollmentDate) AS year,
    MONTH(enrollmentDate) AS month,
    COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY year, month
ORDER BY year, month;

-- Optimized Query 2: Top courses by student enrollment
SELECT 
    c.courseName,
    COUNT(*) AS total_students
FROM enrollments e
JOIN courses c 
    ON e.courseID = c.courseID
GROUP BY c.courseID, c.courseName
ORDER BY total_students DESC;

-- Optimized Query 3: Top instructors by student enrollment
SELECT 
    i.name AS instructor_name,
    COUNT(*) AS total_students
FROM instructors i
JOIN courses c 
    ON i.instructorID = c.instructorID
JOIN enrollments e 
    ON c.courseID = e.courseID
GROUP BY i.instructorID, i.name
ORDER BY total_students DESC;

-- Optimized Query 4: Average students per course
SELECT 
    AVG(student_count) AS avg_students_per_course
FROM (
    SELECT 
        courseID,
        COUNT(*) AS student_count
    FROM enrollments
    GROUP BY courseID
) AS course_counts;

-- Optimized Query 5: Courses with more than 5 students
SELECT 
    c.courseName,
    COUNT(*) AS total_students
FROM enrollments e
JOIN courses c 
    ON e.courseID = c.courseID
GROUP BY c.courseID, c.courseName
HAVING total_students > 5
ORDER BY total_students DESC;