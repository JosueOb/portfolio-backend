FROM python:3.12.0 AS base

# Updating the base image
RUN apt-get update && rm -rf /var/lib/apt/lists/*

# Installing poetry
RUN pip install --upgrade pip
RUN pip install poetry

# Changing the working directory
WORKDIR /usr/src/app

# Copying required files
COPY pyproject.toml ./
COPY poetry.lock ./
COPY main.py ./

# Installing dependencies
RUN poetry install --only main

# Running the main.py
CMD [ "python", "./main.py" ]
