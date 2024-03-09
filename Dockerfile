FROM python:3.12.0 AS base

WORKDIR /usr/src/app

COPY main.py ./

CMD [ "python", "./main.py" ]