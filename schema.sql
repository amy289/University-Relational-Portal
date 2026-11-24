CREATE DATABASE IF NOT EXISTS university_portal
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE university_portal;

CREATE TABLE departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT NOT NULL,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  semester TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB;

CREATE TABLE teachers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT NOT NULL,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  FOREIGN KEY (department_id) REFERENCES departments(id)
) ENGINE=InnoDB;

CREATE TABLE courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT NOT NULL,
  teacher_id INT NOT NULL,
  code VARCHAR(20) NOT NULL UNIQUE,
  title VARCHAR(120) NOT NULL,
  credit_hours TINYINT UNSIGNED NOT NULL DEFAULT 3,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(id)
) ENGINE=InnoDB;

CREATE TABLE enrollments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrolled_on DATE NOT NULL,
  UNIQUE KEY uq_student_course (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  enrollment_id INT NOT NULL,
  attendance_date DATE NOT NULL,
  status ENUM('Present','Absent','Late') NOT NULL,
  FOREIGN KEY (enrollment_id) REFERENCES enrollments(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO departments(name) VALUES
('Software Engineering'),('Computer Science'),('Information Technology');

INSERT INTO students(department_id,name,email,semester) VALUES
(1,'Ayesha Khan','ayesha.khan@example.com',4),
(1,'Ali Raza','ali.raza@example.com',4),
(2,'Sara Ahmed','sara.ahmed@example.com',3),
(2,'Usman Tariq','usman.tariq@example.com',5),
(3,'Hira Noor','hira.noor@example.com',2),
(3,'Bilal Shah','bilal.shah@example.com',6);

INSERT INTO teachers(department_id,name,email) VALUES
(1,'Dr. Sana Malik','sana.malik@example.edu'),
(1,'Mr. Hamza Ali','hamza.ali@example.edu'),
(2,'Dr. Farah Iqbal','farah.iqbal@example.edu'),
(3,'Ms. Nadia Khan','nadia.khan@example.edu');

INSERT INTO courses(department_id,teacher_id,code,title,credit_hours) VALUES
(1,1,'SE201','Database Systems',3),
(1,2,'SE202','Web Technologies',3),
(2,3,'CS210','Data Structures',4),
(3,4,'IT220','Computer Networks',3);

INSERT INTO enrollments(student_id,course_id,enrolled_on) VALUES
(1,1,'2026-01-10'),(1,2,'2026-01-10'),(2,1,'2026-01-11'),
(2,2,'2026-01-11'),(3,3,'2026-01-12'),(4,3,'2026-01-12'),
(5,4,'2026-01-13'),(6,4,'2026-01-13');

INSERT INTO attendance(enrollment_id,attendance_date,status) VALUES
(1,'2026-02-01','Present'),(1,'2026-02-02','Present'),(1,'2026-02-03','Absent'),
(2,'2026-02-01','Present'),(2,'2026-02-02','Late'),
(3,'2026-02-01','Absent'),(3,'2026-02-02','Present'),
(4,'2026-02-01','Present'),(5,'2026-02-01','Present'),
(6,'2026-02-01','Late'),(7,'2026-02-01','Present'),(8,'2026-02-01','Absent');
