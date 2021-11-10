#! /usr/bin/env bash

# Exit in case of error
set -e

# Run this from the root of the project

rm -rf ./testing-project

cookiecutter --no-input -f ./ project_name="Testing Project"

cd ./testing-project

echo "cookiecutter --version"
cookiecutter --version

ls -la ./
ls -la ./backend

pip install -r ./backend/requirements_dev.txt

pytest .

bash ./scripts/test.sh "$@"

cd ../
