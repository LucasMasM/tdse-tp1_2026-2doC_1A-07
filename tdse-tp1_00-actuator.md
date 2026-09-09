Explicación de los Estados (Actuador de la Barrera)

El diagrama modela el comportamiento electromecánico de la barrera de acceso. Dado que los motores físicos tardan un tiempo en mover la barrera, el modelo incluye estados transitorios temporizados.

ST_ACT_OFF (Barrera Baja / Reposo): Es el estado inicial y de reposo del actuador. La barrera está completamente cerrada impidiendo el paso. El sistema espera pasivamente el evento de apertura (EV_ACT_BARON).

ST_ACT_TITR (Transición de Apertura - Tilting / Raising): Es un estado transitorio. Cuando el sistema recibe la orden de abrir, entra en este estado representando el tiempo que el motor físico está girando para levantar la barrera. Utiliza un evento temporal (after 3s) simulando que la barrera tarda exactamente 3 segundos en abrirse por completo.

ST_ACT_ON (Barrera Alta / Abierta): La barrera se encuentra completamente levantada, permitiendo que el vehículo avance. El sistema permanece en este estado hasta que el sensor correspondiente (en el modelo System) detecte que el auto pasó y envíe el evento de cierre (EV_ACT_BAROFF).

ST_ACT_TITL (Transición de Cierre - Tilting / Lowering): Es el estado transitorio de bajada. Al recibir la orden de cierre, el actuador simula el accionamiento del motor para bajar la barrera. Nuevamente, espera 3 segundos (after 3s) hasta que el recorrido finaliza, volviendo automáticamente al estado de reposo ST_ACT_OFF.

Eventos (Triggers) escrutados en el lazo de 1ms
El módulo Actuator debe "escrutar" en cada ciclo de 1 ms si ha llegado algún mensaje desde el modelo System o si se ha cumplido alguna condición temporal (timeout) en sus variables de control:

EV_ACT_BARON: Evento (mensaje) enviado por el sistema indicando que la barrera debe abrirse. Dispara la transición desde el estado de reposo ST_ACT_OFF hacia el estado transitorio ST_ACT_TITR.

EV_ACT_BAROFF: Evento (mensaje) enviado por el sistema indicando que la barrera debe cerrarse. Dispara la transición desde el estado abierto ST_ACT_ON hacia el estado transitorio ST_ACT_TITL.

Evento Temporal (after 3s): En un esquema de Update by Time Code (1 ms), este evento no es un mensaje externo, sino que se escruta evaluando una guarda (guard) sobre una variable de control (ej. timer_barrera). En cada tick de 1 ms, la variable se incrementa. Si [timer_barrera >= 3000], la guarda se cumple y dispara las transiciones desde los estados ST_ACT_TITR a ST_ACT_ON, y de ST_ACT_TITL a ST_ACT_OFF.

2. Acciones (Effects y actualización de hardware/variables)
Las acciones del actuador se dividen en el manejo del hardware (el estado del LED) y el manejo de las variables de control (timers) necesarias para la máquina de estados.

Acciones sobre Variables de Control (Timers):

Inicialización/Reset del timer de barrera: Al ingresar (entry action) a los estados ST_ACT_TITR y ST_ACT_TITL, se ejecuta la acción de reiniciar la variable de temporización (timer_barrera = 0). Esto permite que el lazo de 1 ms comience a contar desde cero hasta llegar a los 3000 ms.

Inicialización/Modificación del timer de parpadeo (blink): Al ingresar a los estados donde el LED debe titilar, se debe inicializar un segundo timer (timer_blink = 0). Cada vez que este timer alcance un valor determinado (por ejemplo, 500 ms), se ejecuta la acción de alternar (toggle) el estado del LED y reiniciar el timer_blink.

Acciones sobre el Hardware (Estado del LED):
Dependiendo del estado en el que se encuentre la máquina, la tarea de actualización ejecuta las siguientes acciones sobre el pin del microcontrolador conectado al LED:

En el estado ST_ACT_OFF: Acción constante de mantener el LED Apagado. (Representa la barrera baja).

En el estado ST_ACT_TITR: Acción de Titilar el LED. Utilizando el timer_blink, el LED conmuta entre encendido y apagado. (Representa el motor levantando la barrera durante 3 segundos).

En el estado ST_ACT_ON: Acción constante de mantener el LED Encendido. (Representa la barrera alta, permitiendo el paso).

En el estado ST_ACT_TITL: Acción de Titilar el LED. Al igual que en la apertura, el LED parpadea para indicar movimiento. (Representa el motor bajando la barrera durante 3 segundos).

# Actuator Statechart - State Transition Table

| Current State | Event | [Guard] | Next State | Actions |
| :--- | :--- | :--- | :--- | :--- |
| **(Initial)** | - | - | **ST_ACT_OFF** | - |
| **ST_ACT_OFF** | `EV_ACT_BARON` | - | **ST_ACT_TITR** | - |
| **ST_ACT_TITR** | `after 3s` (Timer) | - | **ST_ACT_ON** | - |
| **ST_ACT_ON** | `EV_ACT_BAROFF` | - | **ST_ACT_TITL** | - |
| **ST_ACT_TITL** | `after 3s` (Timer) | - | **ST_ACT_OFF** | - |
