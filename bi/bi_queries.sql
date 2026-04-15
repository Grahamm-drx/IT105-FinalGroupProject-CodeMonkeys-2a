-- 1. Total enrollments per month (time-based analysis)
SELECT 
    YEAR(enrollmentDate) AS year,
    MONTH(enrollmentDate) AS month,
    COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY YEAR(enrollmentDate), MONTH(enrollmentDate)
ORDER BY year, month;


-- 2. Number of students per course (course popularity)
SELECT 
    c.courseName,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
GROUP BY c.courseName
ORDER BY total_students DESC;


-- 3. Instructor workload (number of students handled per instructor)
SELECT 
    i.name AS instructor_name,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
JOIN instructors i ON c.instructorID = i.instructorID
GROUP BY i.name
ORDER BY total_students DESC;


-- 4. Average number of students per course (overall course load analysis)
SELECT 
    AVG(student_count) AS avg_students_per_course
FROM (
    SELECT 
        courseID,
        COUNT(studentID) AS student_count
    FROM enrollments
    GROUP BY courseID
) AS course_counts;


-- 5. Courses with high enrollment (filtering using HAVING clause)
SELECT 
    c.courseName,
    COUNT(e.studentID) AS total_students
FROM enrollments e
JOIN courses c ON e.courseID = c.courseID
GROUP BY c.courseName
HAVING COUNT(e.studentID) > 5
ORDER BY total_students DESC;