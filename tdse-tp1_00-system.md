Estados de la Máquina (state => ST_BTN_NAME):  
El modelo se divide en tres estados, todos son estables:
>ST_SYS_OFF : Es el estado inicial (indicado por el círculo negro). Representa el estado de reposo.

>ST_SYS_BTN : Es el estado de espera a la señal del botón. 

>ST_SYS_WAIT : Es el estado de espera a que se vaya el auto.

Eventos de Entrada (Triggers para escrutinio):  
Donde consideramos todas las entradas como botones:  
>EV_CAM_ON: Representa el momento en que la cámara de entrada detecta que un automóvil ha llegado. Dispara la transición desde el estado inicial ST_SYS_OFF hacia el estado ST_SYS_BTN.

>EV_BTN_ON: Representa la acción del usuario presionando el botón de la máquina para solicitar ingreso. Dispara la transición desde el estado ST_SYS_BTN hacia el estado ST_SYS_WAIT.
 
>EV_SNR_OFF: Representa a el sensor detectando que el vehículo ha avanzado y abandonado el sector de la barrera. Dispara la transición de regreso desde el estado ST_SYS_WAIT hacia el estado ST_SYS_OFF.  

Eventos de Salida (Acciones del modelo):  

Las acciones definidas en este modelo se implementan como eventos de salida (out events) que se emiten al ingresar (entry) a los respectivos estados. Estos servirían como señales para el modelo Actuator:  
>EV_ACT_DSP (Display): Se dispara al entrar al estado ST_SYS_BTN. Le indica al módulo actuador que encienda el Display LCD (por ejemplo, para mostrar un mensaje de bienvenida o "Welcome").
 
>EV_ACT_TKT (Printer): Se dispara al entrar al estado ST_SYS_WAIT. Le da la orden al actuador para imprimir el comprobante ("Print ticket").

>EV_ACT_BARON y EV_ACT_BAROFF (Barrier): Se encargan de dar la orden de levantar ("Open barrier") o bajar ("Close barrier") la barrera de paso, respectivamente. Para la etapa de prototipado sin actuadores reales, el estado de la barrera se emula controlando un indicador LED.

>EV_ACT_SVR (Server): Tras cerrarse la barrera (en ST_SYS_OFF), se dispara esta acción para notificar al servidor de estacionamiento (Parking System Server) que el vehículo ingresó exitosamente al predio ("Car inside").
