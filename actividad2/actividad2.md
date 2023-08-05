# Creando un Cronjob para ejecutar un script cada 5 minutos

La implementación de un _cronjob_ es una manera sencilla de programar tareas para que se repitan cada cierto tiempo, esto puede ser muy útil para la creación de copias de seguridad, creación de logs, consultas a sitios web, recordatorios, etc.
 
Las tareas a realizar se pueden indicar en un _script_, el cuál debe poseer un _shebang_ en la primera línea y debe poseer los permisos adecuados de ejecución (750 como buena práctica) 
Los pasos a seguir para la creación del _cronjob_ son los siguientes:

## 1. Ejecutar el comando crontab

Se acompaña de la bandera _-e_, para trabajar con un contrab vacío en caso de no existir. Si es la primera vez que se ejecuta el comando, probablemente se necesite indicar el editor de texto a utilizar, siendo _nano_ el más fácil de utilizar.
![Comando crontab](/actividad2/assets/Crontab1.PNG "Figura 1. Comando crontab")

## 2. Escribir configuración del contrab
En el editor que se muestra, se debe escribir la tarea a repetir en el formato ***** command(s).
![Formato contrab](/actividad2/assets/Crontab2.PNG "Figura 2. Formato Contrab")

En este caso, se ingresa /5 en el primer espacio para indicar que la tarea se repetirá cada 5 minutos y los demás asteriscos quedan vacíos. En el espacio correspondiente al comando, se coloca la ruta absoluta del _script_ que se desea repetir.
![Configuración de contrab](/actividad2/assets/Crontab3.PNG "Figura 3. Configuración Contrab")

Al terminar de escribir la configuración, se presiona Ctrl + O para guardar los cambios, seguido de Ctrl + X para cerrar el editor de texto.

Si al finalizar la terminal muestra el mensaje _"crontab: installing new contrab"_, ¡todo salió bien!

>**Tip**: La creación de archivos y logs dentro del script facilita al programador verificar que las tareas se estén realizando correctamente.

