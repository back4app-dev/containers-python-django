
# syntax=docker/dockerfile:1
FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y --no-install-recommends net-tools
# Install net-tools to use "netstat" command to check for exposed ports

RUN pip install -r requirements.txt

COPY . .


CMD [ "gunicorn", "containers_python_django.wsgi:application", "--bind", "0.0.0.0:8000" ]
