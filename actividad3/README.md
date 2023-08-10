Luisa María Ortíz Romero -  202003381
# Parte 1: Gestión de usuarios
>Nota: Se utiliza _sudo_ en los comandos que necesitan permisos de superusuario si no se ha iniciado sesión anteriormente con este.
## 1. Creación de usuarios
Se solicita la creación de tres usuarios, llamados _usuario1_, _usuario2_ y _usuario3_, respectivamente, para lo cual se utiliza el comando _useradd_ con la bandera _-m_ para indicar que se solicita crear el directorio de trabajo del usuario de manera automática. 
```
sudo useradd -m usuario1
```
```
sudo useradd -m usuario2
```
```
sudo useradd -m usuario3
```
## 2. Asignación de contraseñas 
A continuación, se establecen contraseñas para cada uno de los usuarios creados en la sección anterior.
`sudo passwd usuario1`
Al presionar _enter_, se solicita en la terminal que se ingrese la nueva contraseña, de la siguiente manera:
```
Nueva contraseña:
Vuelva a escribir la nueva contraseña:
```
Y si la operación se llevo a cabo con éxito, se muestra el mensaje:
`passwd: contraseña actualizada correctamente`
Los comandos para asignar contraseña al resto de los usuarios son:
`sudo passwd usuario2`
`sudo passwd usuario3`
## 3. Información de usuarios
La información de usuarios se realiza mediante el comando _id_, a continuación, se muestra la información de _usuario1_.
`id usuario1`
Obteniendo en consola:
`uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1)`
## 4. Eliminación de usuarios
Para eliminar un usuario sin eliminar también su directorio principal, se utiliza el comando _userdel_ sin ninguna bandera, como se realiza a continuación eliminando el usuario _usuario3_.
`sudo userdel usuario3`

# Parte 2: Gestión de grupos
## 1. Creación de grupos
Se solicita la creación de dos grupos llamados _grupo1_ y _grupo2_, respectivamente, para lo cuál se utiliza el comando _groupadd_.
`sudo groupadd grupo1`
`sudo groupadd grupo2` 
## 2. Agregar usuarios a grupos
Se solicita agregar _usuario1_ a _grupo1_ y _usuario2_ a _grupo2_, para lo cual se utiliza el comando _usermod -a -G [grupo] [usuario]_.
`sudo usermod -a -G grupo1 usuario1`
`sudo usermod -a -G grupo2 usuario2`
## 3. Verificar membresía
Para verificar que los usuarios hayan sido agregados a los grupos correctamente, se utiliza el comando _groups_.
Verificando _usuario1_:
`groups usuario1`
`usuario1 : usuario1 grupo1`
Verificando _usuario2_:
`groups usuario2`
`usuario2 : usuario2 grupo2`
## 4. Eliminar grupo
Se solicita eliminar el grupo _grupo2_, para lo cual se utiliza el comando _groupdel_. 
`sudo groupdel grupo2`
# Parte 3: Gestión de permisos
## 1. Creación de archivos y directorios
Se solicita que, como _usuario1_ se cree un archivo llamado _archivo1.txt_ en su directorio principal y escribir algo en él. Posteriormente se solicita crear un directorio llamado _directorio1_ y dentro de ese directorio, un archivo llamado _archivo2.txt_. 

Antes de comenzar a crear archivos y directorios, ejecutamos el comando _cat_ que se muestra a continuación para poder encontrar el directorio de trabajo de _usuario1_. 
`cat /etc/passwd`
En el resultado de la consola, ubicamos la información de _usuario1_. Se puede identificar el directorio de trabajo _/home/usuario1_. 
`usuario1:x:1001:1001::/home/usuario1:/bin/sh
`
Para iniciar sesión como _usuario1_ se utiliza el comando _su_.
`su usuario1`
Se ingresa la contraseña del usuario cuando en la terminal se solicite.  

Movemos el directorio de trabajo al directorio principal que encontramos anteriormente con el comando _cd_.
`cd /home/usuario1`
 
Para crear el archivo, se utiliza el comando _cat_ para poder ingresar el contenido del archivo inmediatamente.
```
cat > archivo1.txt #Presionar [Enter]
Hola mundo :3 
```
Al finalizar de escribir el contenido, presionar _Ctrl + D_ para guardar los cambios. 
 
 Para crear un nuevo directorio, utilizamos el comando _mkdir_.
 `mkdir directorio1`
  
 Para crear un archivo dentro del nuevo directorio, nos movemos a él utilizando nuevamente el comando _cd_.
  `cd directorio1`
Ahora podemos crear un archivo, utilizando el símbolo de redirección de Linux: _>_.
`>archivo2.txt`

## 2. Verificar permisos
Regresamos al directorio principal de trabajo con el comando _cd_.
`cd /home/usuario1`
A continuación, se ejecuta el comando _ls -l_, obteniendo la siguiente salida:
```
-rw-rw-r-- 1 usuario1 usuario1   13 ago  9 19:08 archivo1.txt
drwxrwxr-x 2 usuario1 usuario1 4096 ago  9 19:16 directorio1
```
Se verifican los permisos también con el comando _ls -ld_, obteniendo lo siguiente:
```
drwxr-x--- 4 usuario1 usuario1 4096 ago  9 19:14
```
## 3. Modificar permisos usando _chmod_ con Modo Numérico
Se procede a modificar los permisos de _archivo1.txt_, de modo que, el propietario tenga permisos de lectura y escritura, el grupo de lectura y nadie más pueda hacer nada.
`chmod 640 archivo1.txt`
## 4. Modificar permisos usando _chmod_ con Modo Simbólico
Primero, cambiamos el directorio de trabajo con el comando _cd_:
`cd directorio1`
A continuación, se agrega el permiso de ejecución al propietario de _archivo2.txt_.
`chmod u+x archivo2.txt`
## 5. Cambiar el grupo propietario
Se solicita cambiar el grupo propietario de _archivo2.txt_ a _grupo1_, para lo cual se utiliza el comando _chgrp_.
`chgrp grupo1 archivo2.txt`
## 6. Configurar permisos de directorio
Se solicita configurar los permisos de _directorio1_, de modo que solo el propietario pueda entrar, el grupo pueda listar contenidos pero no entrar y otros no puedan hacer nada. 

Primero nos movemos al directorio principal, el cual contiene a _directorio1_:
`cd /home/usuario1`
Luego ejecutamos el siguiente comando _chmod_:
`chmod 740 directorio1`
## 7. Comprobación de acceso
Para salir de _usuario1_ ingresamos el siguiente comando en consola:
`exit`
Ahora, ingresamos al usuario _usuario2_ con el comando _su_:
`su usuario2`
Ingresamos la contraseña cuando se solicite. 
Ahora, intentamos acceder al directorio principal de _usuario1_:
`cd /home/usuario1`
Pero obtenemos el siguiente mensaje:
`sh: 2: cd: can't cd to /home/usuario1`
Se intenta con la ruta de _archivo1.txt_ y _archivo2_.txt_ pero se obtiene el mismo resultado.
```
$ cd /home/usuario1/archivo1.txt
sh: 3: cd: can't cd to /home/usuario1/archivo1.txt
```

```
$ cd /home/usuario1/directorio1/archivo2.txt
sh: 4: cd: can't cd to /home/usuario1/directorio1/archivo2.txt
```
## 8. Verificación final
Regresamos a _usuario1_ con el comando _su_ para ver el estado final de los permisos de los archivos y directorio creados.
`su usuario1`
Ingresar la contraseña cuando se solicite.
 
Nos movemos al directorio principal:
`cd /home/usuario1`
Ahora, listamos el contenido del directorio para ver los permisos con el comando _ls_:
```
$ ls -l
-rw-r----- 1 usuario1 usuario1   13 ago  9 19:08 archivo1.txt
drwxr----- 2 usuario1 usuario1 4096 ago  9 19:16 directorio1

$ ls -ld
drwxr-x--- 4 usuario1 usuario1 4096 ago  9 19:14 .
```
Nos movemos a _directorio1_ con el comando _cd_:
`cd directorio1`
Ahora, ejecutamos de nuevo el comando _ls_:
```
$ ls -l
-rwxrw-r-- 1 usuario1 grupo1 0 ago  9 19:16 archivo2.txt

$ ls -ld
drwxr----- 2 usuario1 usuario1 4096 ago  9 19:16 .
```

