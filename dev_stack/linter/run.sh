#!/usr/bin/env bash
set -e

echo "Running linter"

# shellcheck disable=SC2034
PYTHON_FILES=$(find "${PORTFOLIO_WORKDIR_PATH}" -name "*.py")

echo "Running isort"
isort "${PYTHON_FILES}"

echo "Running black"
black "${PYTHON_FILES}"

echo "Running flake8"
flake8 --config="${LINTER_WORKDIR_PATH}/.flake8" "${PYTHON_FILES}"

echo "Running mypy"
mypy "${PYTHON_FILES}"
