El sistema "Intelligent Parking Management System" está conformado por un servidor central (Parking System Server), máquinas de entrada y salida (Entry / Exit Machine) y estaciones para el cobro, ya sea una computadora de peaje o una estación de pago automático (Toll Computer / Automatic Pay Station).  
El funcionamiento del "Automated Parking System" se inicia cuando un vehículo llega a la terminal de entrada. Allí, el conductor presiona un botón y la máquina emite una tarjeta o ticket con un número de serie, fecha y hora. Tras esto, se envía una señal para abrir la barrera y el vehículo ingresa al estacionamiento.  
Para retirarse, el cliente debe llevar el ticket a la estación de cobro central para realizar el pago antes de volver a su vehículo. Finalmente, al llegar a la terminal de salida con el ticket pagado, este es leído por la terminal, se envía la señal para abrir la barrera y el auto abandona el lugar.  
La máquina de entrada o "Parking Ticket Dispenser Machine (Entry)" está equipada con un display LCD de 7 pulgadas, un lector de tarjetas, un botón de ayuda, una ranura y un botón para tickets, mensajes de voz y, opcionalmente, un intercomunicador. El sistema de entrada se complementa con una cámara motorizada con luz automática, una barrera de alta velocidad con gatillo por radar y un display LED que muestra los lugares vacantes. 

Implementación de la Parking Ticket Dispenser Machine (Entry)  
La implementación se aborda mediante una estructura de aplicación modular dividida en tres etapas: escrutar, procesar y actuar. El sistema permite editar, verificar, validar, codificar y depurar el modelo de comportamiento disgregado en los módulos de Sensores, Sistema y Actuadores.  
A medida que se depura cada uno de estos módulos, se lo integra a la primera versión de la aplicación utilizando un kit de diseño de software (SDK). Los distintos módulos de la aplicación se comunican y sincronizan entre sí mediante el uso de mensajes.  
El flujo de procesamiento (Process) del sistema establece que cuando el auto llega, se activa un mensaje de bienvenida (Welcome); cuando se presiona el botón, se imprime el ticket (Print ticket) y se abre la barrera (Open barrier); y cuando el auto se retira, se cierra la barrera (Close barrier) y se registra que el auto está adentro (Car inside).

Modelos de comportamiento de los módulos de código C (Tipo temporizado, period = 1mS)  
El código se ejecuta de forma cíclica con tareas no bloqueantes cada 1mS, garantizando un comportamiento comunitario en el cual ningún módulo se apropia de forma exclusiva de la CPU. El comportamiento para cada etapa es el siguiente:  

>Escrutar => Sensor (Digital Inputs): El ejecutivo cíclico evalúa todos los sensores. El sensor verifica si hubo algún cambio ("Any Change?") y, en caso afirmativo, envía un mensaje ("Put Message") a la interfaz del sistema.  

>Procesar => System: La interfaz del sistema evalúa si ingresó alguna solicitud ("Any Message?") y la carga ("Load Message") para enviarla al módulo del sistema. Una vez procesada, si la lógica determina que debe haber una modificación ("Any Change?"), el sistema coloca un mensaje ("Put Message") destinado a la interfaz de los actuadores. 

>Actuar => Actuator (Digital Outputs): La interfaz de los actuadores verifica si existe algún mensaje dirigido a ellos ("Any Message?") y lo carga ("Load Message"). Si la orden implica un cambio ("Any Change?"), el actuador ejecuta la acción correspondiente ("Make Action").

Reemplazo de sensores y actuadores reales  
El documento especifica los siguientes reemplazos en caso de no contar con el hardware real:  
Para los sensores (Digital Inputs):
>Camera: Se puede reemplazar por llaves_On_Off.

>Button: Se puede reemplazar por un pulsador.
 
>Sensor coil: Se puede reemplazar por llaves_On_Off.

Para los actuadores (Digital Outputs):
Reemplazo por LEDs los siguientes dispositivos: Display, Printer, Barrier y Server
