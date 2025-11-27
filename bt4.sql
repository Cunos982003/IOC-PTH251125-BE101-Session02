create database ElearningDB;
create schema elearning;
CREATE TABLE elearning.Student
(
    student_id serial primary key,
    first_name varchar(50) NOT NULL,
    last_name  varchar(50) NOT NULL,
    email      varchar(30) NOT NULL UNIQUE
);
CREATE TABLE elearning.Instructor
(
    instructor_id serial primary key,
    first_name varchar(50) NOT NULL,
    last_name  varchar(50) NOT NULL,
    email      varchar(30) NOT NULL UNIQUE
);

CREATE TABLE elearning.Course
(
    course_id serial primary key,
    course_name varchar(100) NOT NULL,
    instructor_id int references elearning.Instructor(instructor_id)
);

CREATE TABLE  elearning.Enrollment
(
    enrollment_id serial primary key,
    student_id int references elearning.student(student_id),
    course_id int references  elearning.course(course_id),
    enroll_date date
);
CREATE TABLE  elearning.Assignment
(
    assignment_id serial primary key,
    course_id int references  elearning.course(course_id),
    title varchar(100) NOT NULL,
    due_date date NOT NULL
);
CREATE TABLE  elearning.Submissions
(
    submission_id serial primary key,
    student_id int references elearning.student(student_id),
    assignment_id int references  elearning.assignment(assignment_id),
    submission_date date NOT NULL,
    grade NUMERIC(5,2) CHECK (grade >= 0 AND grade <= 100)

);

