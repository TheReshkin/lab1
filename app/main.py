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
sql_query = """
SELECT DISTINCT professor_name
FROM exams;

"""

cursor.execute(sql_query)
results = cursor.fetchall()
cursor.close()
connection.close()

# Вывод результатов в виде таблицы и запись в файл
output_table = PrettyTable(["Предмет", "Дата экзамена"])

for row in results:
    output_table.add_row(row)

with open("output/output.txt", "w") as file:
    file.write(str(output_table))
