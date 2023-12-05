# Используем базовый образ Python
FROM python:3.9

# Устанавливаем рабочую директорию в /app
WORKDIR /app
MKDIR /output
# Копируем файл requirements.txt в рабочую директорию
COPY requirements.txt /app/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем текущий каталог (включая все файлы) в рабочую директорию контейнера
COPY . /app/

# Команда для запуска приложения
CMD ["python", "main.py"]
