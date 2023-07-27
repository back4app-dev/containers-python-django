
# syntax=docker/dockerfile:1
FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
# The COPY command is used to copy the requirements.txt file from the host to the container

RUN apt-get update && apt-get install -y --no-install-recommends net-tools
# The above command is used to update the package repository and install net-tools package, 
# which includes the "netstat" command to check for exposed ports

RUN pip install -r requirements.txt
# Installing the required Python packages specified in the requirements.txt file

COPY . .

# Expose the port 8000 which is used by the application

CMD [ "gunicorn", "containers_python_django.wsgi:application", "--bind", "0.0.0.0:8000" ]
# Start the Gunicorn server with the provided command, binding it to 0.0.0.0:8000
