############################################
# Base Image
############################################
FROM python:3.12.0 AS base

# Updating the base image
RUN apt-get update && rm -rf /var/lib/apt/lists/*

# Installing poetry
RUN pip install --upgrade pip
RUN pip install poetry

# Changing the working directory
ENV PORTFOLIO_WORKDIR_PATH=/home/portfolio-backend
WORKDIR $PORTFOLIO_WORKDIR_PATH

# Copying required files
COPY pyproject.toml ./
COPY poetry.lock ./
COPY src/ ./src
COPY main.py ./

# Installing dependencies
RUN poetry config virtualenvs.create false
RUN poetry install --only main

############################################
# Development Image
############################################
FROM base AS development

# Copying required files
COPY dev_stack/server/run.sh ./scripts/server/run.sh

# Installing linter dependencies
RUN poetry install --with linter

# Running the live server
CMD [ "./scripts/server/run.sh" ]
