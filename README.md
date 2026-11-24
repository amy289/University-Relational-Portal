# Lab 10 — MySQL + SQL: University Relational Database

## Database contents
Six related tables: `departments`, `students`, `teachers`, `courses`, `enrollments`, and `attendance`. The schema uses primary keys, foreign keys, UNIQUE constraints and an ENUM attendance status. Sample records are included.

## Requirements
- XAMPP with MySQL and phpMyAdmin, or another MySQL 8-compatible setup

## Import with phpMyAdmin
1. Start MySQL in XAMPP.
2. Open `http://localhost/phpmyadmin`.
3. Select the **Import** tab.
4. Choose `schema.sql` and click **Import/Go**.
5. Open the `university_portal` database and inspect its six tables.
6. To run practice queries, open the SQL tab and paste statements from `queries.sql`.

## Files
- `schema.sql` — creates database, tables and seed data
- `queries.sql` — 18 practice SQL statements, including JOINs and aggregate reports
- `LAB_REPORT.md` — ready-to-edit lab report

## Notes
Import `schema.sql` once into a clean environment. Re-importing may fail if tables already exist. `queries.sql` includes two write examples at the end; the DELETE statement is commented out for safety. The UPDATE changes student 1's semester to 5.
