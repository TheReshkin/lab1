-- Создаем таблицу студентов
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    record_book_number VARCHAR(20)
);

-- Создаем таблицу предметов
CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Создаем таблицу экзаменов
CREATE TABLE exams (
    exam_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    subject_id INT REFERENCES subjects(subject_id),
    exam_date DATE,
    professor_name VARCHAR(100)
);

-- Вставляем данные в таблицу студентов
INSERT INTO students (first_name, last_name, birth_date, record_book_number) VALUES
    ('Иван', 'Иванов', '1998-01-15', '123456'),
    ('Мария', 'Петрова', '1997-05-20', '789012'),
    ('Александр', 'Сидоров', '1999-11-10', '345678');

-- Вставляем данные в таблицу предметов
INSERT INTO subjects (subject_name) VALUES
    ('Математика'),
    ('Физика'),
    ('Информатика');
-- Вставляем данные в таблицу экзаменов
INSERT INTO exams (student_id, subject_id, exam_date, professor_name) VALUES
    (1, 1, '2023-05-15', 'Иванов И.И.'),
    (1, 2, '2023-06-20', 'Петрова М.В.'),
    (1, 3, '2023-07-10', 'Сидоров А.А.'),
    (2, 1, '2023-05-20', 'Иванов И.И.'),
    (2, 2, '2023-06-25', 'Петрова М.В.'),
    (2, 3, '2023-07-15', 'Сидоров А.А.'),
    (3, 1, '2023-05-25', 'Иванов И.И.'),
    (3, 2, '2023-06-30', 'Петрова М.В.'),
    (3, 3, '2023-07-20', 'Сидоров А.А.');
