create database UniversityDB;
create schema university;
CREATE TABLE university.Student
(
    student_id bigserial primary key,
    first_name varchar(50) NOT NULL,
    last_name  varchar(50) NOT NULL,
    birth_date date check (birth_date < current_date),
    email      varchar(30) NOT NULL UNIQUE
);

CREATE TABLE university.Course
(
    course_id bigserial primary key,
    course_name varchar(100) NOT NULL,
    credit numeric(10,2)
);

CREATE TABLE university.Enrollment
(
    enrollment_id bigserial primary key,
    student_id int references university.student(student_id),
    course_id int references university.course(course_id),
    enroll_date date
);

SELECT datname FROM pg_database;

SELECT schema_name
FROM information_schema.schemata;

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'student';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'course';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'enrollment';





