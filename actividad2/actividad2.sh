#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

echo $"Ingrese GITHUB_USER:"
read GITHUB_USER
BASE="https://api.github.com/users/"
URL="$BASE$GITHUB_USER"
USER_ID=$(curl -s $URL | jq '.id')
CREATED_AT=$(curl -s $URL | jq '.created_at')

printf "%s" "Hola " "$GITHUB_USER" ". User ID: " "$USER_ID" ". Cuenta fue creada el: " "$CREATED_AT"