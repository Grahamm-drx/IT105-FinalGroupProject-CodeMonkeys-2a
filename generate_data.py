from faker import Faker
import random

fake = Faker()

output_file = "data/data.sql"

USERS = 5000
STUDENTS = 40000
INSTRUCTORS = 2000
COURSES = 10000
ENROLLMENTS = 40000
AUDIT_LOGS = 5000

with open(output_file, "w", encoding="utf-8") as f:
    f.write("USE student_management_systemDB;\n\n")

    for i in range(1, USERS + 1):
        role = random.choice(["admin", "staff"])
        f.write(
            f"INSERT INTO users (username, password, role) VALUES "
            f"('user{i}', 'pass{i}', '{role}');\n"
        )

    for i in range(1, STUDENTS + 1):
        f.write(
            f"INSERT INTO students (firstName, lastName, email) VALUES "
            f"('{fake.first_name()}', '{fake.last_name()}', 'student{i}@example.com');\n"
    )

    for i in range(1, INSTRUCTORS + 1):
        f.write(
            f"INSERT INTO instructors (name, email) VALUES "
            f"('{fake.name()}', 'instructor{i}@example.com');\n"
    )

    for i in range(1, COURSES + 1):
        instructor_id = random.randint(1, INSTRUCTORS)
        f.write(
            f"INSERT INTO courses (courseName, instructorID) VALUES "
            f"('Course {i}', {instructor_id});\n"
        )

    for i in range(1, ENROLLMENTS + 1):
        student_id = random.randint(1, STUDENTS)
        course_id = random.randint(1, COURSES)
        grade = random.choice(["A", "B", "C", "D", "F"])
        date = fake.date()
        f.write(
            f"INSERT INTO enrollments (studentID, courseID, enrollmentDate, grade) VALUES "
            f"({student_id}, {course_id}, '{date}', '{grade}');\n"
        )

    for i in range(1, AUDIT_LOGS + 1):
        f.write(
            f"INSERT INTO audit_logs (action, tableName) VALUES "
            f"('INSERT', 'students');\n"
        )

print("DONE: data.sql generated successfully!")

import os

print(os.path.abspath(output_file))
