# Lab 10 Report — MySQL + SQL: University Relational Database

## Objective
Design relational tables, use keys and constraints, write CRUD SQL, apply JOIN/GROUP BY/aggregate functions and understand normalization.

## Tools
MySQL, phpMyAdmin and SQL (XAMPP can provide the local MySQL server).

## Database design
The database contains departments, students, teachers, courses, enrollments and attendance. Primary keys uniquely identify rows. Foreign keys connect related entities. UNIQUE constraints prevent duplicate department names, student/teacher emails, course codes and duplicate student-course enrollments.

## Implementation
Created the schema in `schema.sql`, inserted sample seed data in dependency order, and prepared more than 15 SQL queries in `queries.sql`. Queries demonstrate SELECT, filtering, JOIN, LEFT JOIN, GROUP BY, COUNT, AVG, SUM, attendance percentage, UPDATE and a commented DELETE example.

## Result
The university database can store department, student, teacher, course, enrollment and attendance information and produce joined and aggregate reports.

## Normalization and constraints
Separate tables reduce repeated data. Foreign keys maintain referential integrity. UNIQUE and NOT NULL constraints protect data quality. The enrollment table resolves the many-to-many relationship between students and courses.

## Evidence to add
Add screenshots of the imported six-table database, relationship/structure view, and at least three query outputs. Include Git commit history and exported SQL file.
