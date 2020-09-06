FROM python:3.7.8-slim-buster

ENV FLASK_APP app.py

WORKDIR /app
COPY requirements.txt ./

RUN apt-get update && \
    apt-get install -y gcc nginx&& \
    rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt

COPY ./CICD-example-app ./CICD-example-app

EXPOSE 5000

CMD [ "flask", "run" ]