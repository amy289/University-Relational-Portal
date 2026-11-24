USE university_portal;

-- 1. Show all departments
SELECT * FROM departments;

-- 2. Students with their department names
SELECT s.id, s.name, s.email, d.name AS department
FROM students s JOIN departments d ON d.id = s.department_id;

-- 3. Teachers with their departments
SELECT t.name AS teacher, d.name AS department
FROM teachers t JOIN departments d ON d.id = t.department_id;

-- 4. Courses with department and teacher
SELECT c.code, c.title, d.name AS department, t.name AS teacher
FROM courses c JOIN departments d ON d.id=c.department_id
JOIN teachers t ON t.id=c.teacher_id;

-- 5. Students in semester 4
SELECT * FROM students WHERE semester=4;

-- 6. Count students by department
SELECT d.name, COUNT(s.id) AS student_count
FROM departments d LEFT JOIN students s ON s.department_id=d.id
GROUP BY d.id,d.name;

-- 7. Count courses by department
SELECT d.name, COUNT(c.id) AS course_count
FROM departments d LEFT JOIN courses c ON c.department_id=d.id
GROUP BY d.id,d.name;

-- 8. Enrollment count for each course
SELECT c.code,c.title,COUNT(e.id) AS enrollments
FROM courses c LEFT JOIN enrollments e ON e.course_id=c.id
GROUP BY c.id,c.code,c.title;

-- 9. List each student's enrolled courses
SELECT s.name,c.code,c.title
FROM enrollments e JOIN students s ON s.id=e.student_id
JOIN courses c ON c.id=e.course_id
ORDER BY s.name;

-- 10. Students with no enrollments
SELECT s.id,s.name FROM students s
LEFT JOIN enrollments e ON e.student_id=s.id
WHERE e.id IS NULL;

-- 11. Average semester by department
SELECT d.name,ROUND(AVG(s.semester),2) AS average_semester
FROM departments d JOIN students s ON s.department_id=d.id
GROUP BY d.id,d.name;

-- 12. Total credit hours per student
SELECT s.name,SUM(c.credit_hours) AS total_credit_hours
FROM students s JOIN enrollments e ON e.student_id=s.id
JOIN courses c ON c.id=e.course_id
GROUP BY s.id,s.name;

-- 13. Attendance totals by status
SELECT status,COUNT(*) AS total
FROM attendance GROUP BY status;

-- 14. Attendance percentage per student
SELECT s.name,
ROUND(100*SUM(a.status='Present')/COUNT(a.id),2) AS attendance_percent
FROM students s JOIN enrollments e ON e.student_id=s.id
JOIN attendance a ON a.enrollment_id=e.id
GROUP BY s.id,s.name;

-- 15. Course-wise present/absent summary
SELECT c.code,c.title,
SUM(a.status='Present') AS present_count,
SUM(a.status='Absent') AS absent_count
FROM courses c JOIN enrollments e ON e.course_id=c.id
JOIN attendance a ON a.enrollment_id=e.id
GROUP BY c.id,c.code,c.title;

-- 16. Search students by name (change the keyword)
SELECT * FROM students WHERE name LIKE '%Ayesha%';

-- 17. Update a student's semester
UPDATE students SET semester=5 WHERE id=1;

-- 18. Delete a sample attendance record (run only if intended)
-- DELETE FROM attendance WHERE id=12;
