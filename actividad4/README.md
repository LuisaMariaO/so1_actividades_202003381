# Actividad 4

Luisa María Ortíz Romero - 202003381
>**Nota:** Para este ejemplo se utilizó Linux Mint 21.1

Para que el servicio funcione correctamente, es necesario que el archivo con el script tenga los permisos correctos, se recomiendan permisos 750.

```
chmod 750 actividad4.sh
```

Ahora es necesario crear el servicio, para lo cual nos dirigimos a la carpeta _/etc/systemd/system_

```
cd /etc/systemd/system
```

Creamos el archivo con el comando _touch_ 

```
sudo touch actividad4.service
```

Agregamos el contenido del archivo utilizando _nano_

```
sudo nano actividad4.service
```

En el editor que se abre escribo la información necesaria, como la descripción del servicio, la ubicación del script, el usuario que lo creó y su grupo, además de indicarle que se repita cada 30 segundos.

![Cuerpo del archivo actividad4.service](/actividad4/assets/nano.png)

Al finalizar, presionar _Ctrl+O_ para guardar y _Ctrl+X_ para salir del editor.

A continuación, se habilita el servicio con el siguiente comando:

```
sudo systemctl enable actividad4.service
```

Ahora es posible iniciar el servicio:
```
sudo systemctl start actividad4.service
```

¡Listo!

Ahora podemos verificar el estado del servicio con el siguiente comando:
```
sudo systemctl status actividad4.service
```

Se obtiene una salida como la siguiente:

![Estado del servicio](/actividad4/assets//status.png)

Para ver los mensajes impresos por el servicio, tenemos el siguiente comando:

```
sudo journalctl -u actividad4.service
```
Y podemos ver la siguiente salida:

![Mensajes del servicio](/actividad4/assets/msg.png)

En la salida se puede identificar cuándo el servicio comienza, cuándo imprime el saludo y la fecha y hora actuales, cuándo termina y se reinicia.

Por último, es posible parar el servicio con el siguiente comando:
```
sudo systemctl stop actividad4.service
```
