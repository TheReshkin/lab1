import os
import psycopg2
from prettytable import PrettyTable  # Библиотека для вывода в виде красивых таблиц

with open("output/log.txt", "w") as file:
    file.write(str(os.environ))

connection = psycopg2.connect(
    host=os.environ.get("DB_HOST"),
    database=os.environ.get("DB_NAME"),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASSWORD")
)

cursor = connection.cursor()
sql_query = """SELECT DISTINCT e.professor_name, s.subject_name
FROM exams e
JOIN subjects s ON e.subject_id = s.subject_id;
"""

cursor.execute(sql_query)
results = cursor.fetchall()
cursor.close()
connection.close()

# Вывод результатов в виде таблицы и запись в файл
output_table = PrettyTable(["Преподаватель", "Название предмета"])

for row in results:
    output_table.add_row(row)

with open("output/output.txt", "w") as file:
    file.write(str(output_table))
