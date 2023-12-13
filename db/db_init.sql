CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    record_book_number VARCHAR(20)
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE exams (
    subject_id INT REFERENCES subjects(subject_id),
    exam_date DATE,
    professor_name VARCHAR(100)
);

CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    exam_id SERIAL REFERENCES exams,
    grade INT CHECK (grade >= 2 AND grade <= 5)
);

INSERT INTO subjects (subject_name) VALUES
    ('Математика'),
    ('Физика'),
    ('Информатика'),
    ('Инструментальный анализ защищенности'),
    ('Модели развертывания удаленных сервисов');

INSERT INTO students (first_name, last_name, birth_date, record_book_number) VALUES
    ('Анна', 'Козлова', '2002-03-12', '111111'),
    ('Дмитрий', 'Попов', '2001-07-28', '222222'),
    ('Елена', 'Николаева', '2000-11-05', '333333');

INSERT INTO exams (subject_id, exam_date, professor_name) VALUES
    (1, '2023-05-15', 'Иванов И.И.'),
    (2, '2023-06-20', 'Петрова М.В.'),
    (3, '2023-07-10', 'Сидоров А.А.'),
    (4, '2023-07-15', 'Иванов И.И.'),
    (5, '2023-07-20', 'Петрова М.В');

INSERT INTO students (first_name, last_name, birth_date, record_book_number) VALUES
    ('Алексей', 'Смирнов', '2003-02-18', '444444'),
    ('Татьяна', 'Ковалева', '2002-09-30', '555555'),
    ('Игорь', 'Поляков', '2001-12-08', '666666'),
    ('Екатерина', 'Морозова', '2003-07-14', '777777'),
    ('Владислав', 'Лебедев', '2002-05-25', '888888');

INSERT INTO grades (student_id, exam_id, grade) VALUES
    (1, 1, 4),
    (1, 2, 5),
    (1, 3, 3),
    (2, 1, 4),
    (2, 2, 5),
    (2, 3, 4),
    (3, 1, 3),
    (3, 2, 4),
    (3, 3, 5),
    (4, 1, 5),
    (4, 2, 3),
    (4, 3, 4),
    (5, 1, 4),
    (5, 2, 5),
    (5, 3, 3);
