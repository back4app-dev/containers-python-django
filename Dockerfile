
# syntax=docker/dockerfile:1
FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y --no-install-recommends net-tools
# The error message states that the Dockerfile must expose a TCP port. We need to install net-tools to use the "netstat" command to check for exposed ports.

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000
# We need to specify the port that the container will listen to.

CMD [ "gunicorn", "containers_python_django.wsgi:application", "--bind", "0.0.0.0:8000" ]
