import os
import psycopg2
from prettytable import PrettyTable  # Библиотека для вывода в виде красивых таблиц

with open("output/log.txt", "w") as file:
    file.write(str(os.environ))
# Подключение к базе данных
connection = psycopg2.connect(
    host=os.environ.get("DB_HOST"),
    database=os.environ.get("DB_NAME"),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASSWORD")
)

# Создание курсора
cursor = connection.cursor()

# Выполнение SQL-запроса
sql_query = """
SELECT subjects.subject_name, exams.exam_date
FROM subjects
JOIN exams ON subjects.subject_id = exams.subject_id;
"""

cursor.execute(sql_query)

# Получение результатов
results = cursor.fetchall()

# Закрытие соединения с базой данных
cursor.close()
connection.close()

# Вывод результатов в виде таблицы и запись в файл
output_table = PrettyTable(["Предмет", "Дата экзамена"])

for row in results:
    output_table.add_row(row)

with open("output/output.txt", "w") as file:
    file.write(str(output_table))
