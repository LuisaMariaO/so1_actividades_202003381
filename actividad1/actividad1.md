# Actividad 1
 Luisa María Ortíz Romero
 202003381

# Tipos de Kernel y sus diferencias
La traducción al español de  _kernel_ es _núcleo_, por lo tanto, el kernel es el núcleo de un Sistema Operativo.
 En una estructura simple, todo lo que está por debajo de la interfaz de llamadas al sistema y por encima del hardware físico es el kernel. 

Principalmente, se pueden clasificar los kernel en 2 tipos:

## Kernel Monolítico
Todo el código y estructuras de datos del kernel se mantienen en una sola dirección de almacenamiento, incluyendo todos los controladores de dispositivos, los sistemas de archivos y el código de interconexión de red. Los sistemas operativos monolíticos tienen un solo ejecutable que funciona en modo privilegiado y contiene todos los servicios principales del sistema operativo, como la gestión de procesos, gestión de memoria, gestión de archivos, etc
> Linux y Solaris son ejemplos de sistemas operativos con kernel monolítico.

## Microkernel
Nace con la creación de un sistema operativo llamado _Mach_, creado en los años 80 por la universidad de Carnegie Mellon, el cuál modularizaba el kernel, debido a que con las actualizaciones tecnológicas el kernel se había hecho grande y difícil de gestionar. 

En un microkernel se estructura el sistema operativo eliminando todos los componentes no esenciales del kernel e implementándolos como programas del sistema y de nivel de usuario; el resultado es un kemel más pequeño. No hay consenso en lo que se refiere a qué servicios deberían permanecer en el kemel y cuáles deberían implementarse en el espacio de usuario. Sin embargo, normalmente los microkernels proporcionan una gestión de la memoria y de los procesos mínima, además de un mecanismo de comunicaciones.
>Sistemas operativos actuales como Tru64 UNIX y QNX utilizan el método microkernel.

Existe la posibilidad de lograr un **kernel híbrido** en el cuál se combinan características de los kernel monolíticos y microkernel, en el que se incluyen componentes que pueden ser considereados como _no escencieles_ en el kernel para lograr ejecuciones más rápidas, como es el caso de Windows NT.

# User Mode vs Kernel Mode
Para obtener una ejecución correcta del sistema operativo, es necesario distinguir entre la ejecución del código del sistema operativo y del código definido por el usuario, para lo cuál se necesitan dos modos de operación: **modo usuario y modo kernel**. Un bit, denominado _bit de modo_, se añade al hardware de la computadora para indicar el modo actual: kernel (0) o usuario (1)

## User Mode
Cuando el sistema informático está ejecutando una aplicación de usuario, el sistema se encuentra en modo de usuario. Sin embargo, cuando una aplicación de usuario solicita un servicio del sistema operativo (llamadas al sistema como interrupciones, uso de dispositivos de entrada o salida, solicitud de memoria, uso del sistema de archivos, etc.), debe pasar del modo de usuario al modo kernel el para satisfacer la solicitud.
## Kernel Mode
Cuando se arranca el sistema, el hardware se inicia en el modo kernel . El sistema operativo se carga y se inician las aplicaciones de usuario en el modo usuario. Cuando se produce una excepción o interrupción, el hardware conmuta del modo de usuario al modo kernel (es decir, cambia el estado del bit de modo a 0). En consecuencia, cuando el sistema operativo obtiene el control de la computadora, estará en el modo kernel. El sistema siempre cambia al modo de usuario (poniendo el bit de modo a 1) antes de pasar el control a un programa de usuario.
>Nota: El modo kernel también es conocido como modo de supervisor, modo del sistema o modo privilegiado.



### Referencias
Félix, G. C. (2015, October 1). _Análisis, diseño e implementación de un módulo Linux para el acceso a servidores NFS_. https://e-archivo.uc3m.es/handle/10016/26134

Silberschatz, A., Galvin, P. B., & Gagne, G. (2006). _Fundamentos de sistemas operativos_