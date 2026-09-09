Eventos de Entrada (Triggers para escrutinio):  

En una implementación de código C temporizada con un periodo de 1 ms, la función encargada de actualizar la máquina de estados deberá "escrutar" (hacer polling) de los siguientes eventos para evaluar las transiciones:  
>EV_CAM_ON: Representa el momento en que la cámara de entrada detecta que un automóvil ha llegado. Dispara la transición desde el estado inicial ST_SYS_OFF hacia el estado ST_SYS_BTN.  
>EV_BTN_ON: Dispara la transición desde el estado ST_SYS_BTN hacia el estado ST_SYS_WAIT.  
>EV_SNR_OFF: Dispara la transición de regreso desde el estado ST_SYS_WAIT hacia el estado ST_SYS_OFF.  

Eventos de Salida (Acciones del modelo):  

Las acciones definidas en este modelo se implementan como eventos de salida (out events) que se emiten al ingresar (entry) a los respectivos estados. Estos servirían como señales para el modelo Actuator:  
>En el estado ST_SYS_OFF: Al ingresar a este estado, se ejecutan las acciones (emisión de eventos) EV_ACT_BAROFF y EV_ACT_SVR. 
>En el estado ST_SYS_BTN: Al ingresar a este estado, se ejecuta la acción EV_ACT_DSP.  
>En el estado ST_SYS_WAIT: Al ingresar a este estado, se ejecutan las acciones EV_ACT_TKT y EV_ACT_BARON.
