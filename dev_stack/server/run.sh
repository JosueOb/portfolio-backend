#!/usr/bin/env bash
set -e

echo "Running the live server"

uvicorn main:api --reload --host 0.0.0.0 --port 8000
