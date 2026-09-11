Explicación de los Estados (Actuador de la Barrera)

El diagrama modela el comportamiento electromecánico de la barrera de acceso. Dado que los motores físicos tardan un tiempo en mover la barrera, el modelo incluye estados transitorios temporizados.

Estados de la Máquina (state => ST_BTN_NAME):
El modelo se divide en cuatro estados, dos estables y dos transitorios (ventanas de validación):

>ST_ACT_OFF (Barrera Baja / Reposo): Es el estado inicial y de reposo del actuador. La barrera está completamente cerrada impidiendo el paso. El led está apagado.

>ST_ACT_TITR (Transición de Apertura - Tilting / Raising): Cuando el sistema recibe la orden de abrir, entra en este estado representando el tiempo que el motor físico está girando para levantar la barrera. Utiliza un evento temporal (after 3s) simulando que la barrera tarda exactamente 3 segundos en abrirse por completo. Se ve como un led que tiene su luz titilando.

>ST_ACT_ON (Barrera Alta / Abierta): La barrera se encuentra completamente levantada, permitiendo que el vehículo avance. El sistema permanece en este estado hasta que el sensor correspondiente (en el modelo System) detecte que el auto pasó. El led está encendido.

>ST_ACT_TITL (Transición de Cierre - Tilting / Lowering): Al recibir la orden de cierre, el actuador simula el accionamiento del motor para bajar la barrera. Nuevamente, espera 3 segundos (after 3s) hasta que el recorrido finaliza, volviendo automáticamente a estar en reposo. Se ve como un led que tiene su luz titilando.

Eventos de Entrada (Triggers para escrutinio):

>EV_ACT_BARON: Evento (mensaje) enviado por el sistema indicando que la barrera debe abrirse. Dispara la transición desde el estado de reposo ST_ACT_OFF hacia el estado transitorio ST_ACT_TITR.

>EV_ACT_BAROFF: Evento (mensaje) enviado por el sistema indicando que la barrera debe cerrarse. Dispara la transición desde el estado abierto ST_ACT_ON hacia el estado transitorio ST_ACT_TITL.

# Actuator Statechart - State Transition Table

| Current State | Event | [Guard] | Next State | Actions |
| :--- | :--- | :--- | :--- | :--- |
| **(Initial)** | - | - | **ST_ACT_OFF** | - |
| **ST_ACT_OFF** | `EV_ACT_BARON` | - | **ST_ACT_TITR** | - |
| **ST_ACT_TITR** | `after 3s` (Timer) | - | **ST_ACT_ON** | - |
| **ST_ACT_ON** | `EV_ACT_BAROFF` | - | **ST_ACT_TITL** | - |
| **ST_ACT_TITL** | `after 3s` (Timer) | - | **ST_ACT_OFF** | - |

---
*Nota de implementación: Las condiciones after 3s se implementan en C mediante un temporizador interno (timer) incrementado cíclicamente cada 1 mS (tick). Los estados de titilado (TITR / TITL) ejecutan la conmutación periódica del actuador mientras la variable de control permanezca en timer < 3000.*
