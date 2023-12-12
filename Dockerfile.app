
FROM python:3.9


WORKDIR /app
RUN mkdir /output

COPY app/requirements.txt /app/


RUN pip install --no-cache-dir -r requirements.txt


COPY . /app/

CMD ["python", "main.py"]
