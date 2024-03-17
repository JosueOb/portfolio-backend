#!/usr/bin/env bash
set -e

echo "Running linter"

# shellcheck disable=SC2034
PYTHON_FILES=$(find "${PORTFOLIO_WORKDIR_PATH}" -name "*.py")

echo "Running isort"
# shellcheck disable=SC2086
isort ${PYTHON_FILES}

echo "Running black"
# shellcheck disable=SC2086
black ${PYTHON_FILES}

echo "Running flake8"
# shellcheck disable=SC2086
flake8 --config="${LINTER_WORKDIR_PATH}/.flake8" ${PYTHON_FILES}

echo "Running mypy"
# shellcheck disable=SC2086
mypy ${PYTHON_FILES}
