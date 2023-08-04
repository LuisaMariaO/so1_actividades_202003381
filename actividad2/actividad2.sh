#!/bin/bash

#Para la ejecución si se encuentra un error
set -o errexit
#Las variables indefinidas son tratadas como errores
set -o nounset
#Si una parte del flujo falla, todo falla
set -o pipefail

echo $"Ingrese GITHUB_USER:"
#Lectura del usuario de github a consultar
read GITHUB_USER

BASE="https://api.github.com/users/"
#Concatenación de la url base y el usuario
URL="$BASE$GITHUB_USER"
#Capturando el atributo <id> del json de respuesta
USER_ID=$(curl -s $URL | jq '.id')
#Capturando el atributo <created_at> del json de respuesta
CREATED_AT=$(curl -s $URL | jq '.created_at')

#Imprimiento el mensaje en pantalla
printf "%s" "Hola " "$GITHUB_USER" ". User ID: " "$USER_ID" ". Cuenta fue creada el: " "$CREATED_AT"

#Obtengo la fecha actual en formato YYYY-MM-DD
DATE=$(date +%F)
#Si no existe la carpeta con la fecha, se crea
mkdir -p /tmp/$DATE
#Si no existe el archivo saludos.log, se crea
touch /tmp/$DATE/saludos.log

#Se redirige el comando printf para imprimir el mensaje en el archivo de logs
printf "%s" "Hola " "$GITHUB_USER" ". User ID: " "$USER_ID" ". Cuenta fue creada el: " "$CREATED_AT" > /tmp/$DATE/saludos.log