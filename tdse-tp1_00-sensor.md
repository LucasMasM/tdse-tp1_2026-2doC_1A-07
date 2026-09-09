El objetivo principal de este modelo es resolver por software el problema del rebote mecánico (debouncing), garantizando que las rápidas fluctuaciones eléctricas que ocurren al presionar o soltar el botón no generen falsas lecturas en el sistema principal.

Estados de la Máquina (state => ST_BTN_NAME):  
El modelo se divide en cuatro estados, dos estables y dos transitorios (ventanas de validación):
>ST_BTN_UP (Estable - Suelto): Es el estado inicial (indicado por el círculo negro). Representa el botón en reposo.

>ST_BTN_DOWN (Estable - Presionado): Representa el botón firmemente presionado.

>ST_BTN_FALL (Transitorio - Validando presión): Estado intermedio al detectar la primera señal de presión. Actúa como filtro anti-rebote.

>ST_BTN_RISE (Transitorio - Validando liberación): Estado intermedio al detectar la primera señal de que el botón se ha soltado.

Eventos de Hardware (event => EV_BTN_NAME):
Son las lecturas físicas inmediatas (crudas) del pin del microcontrolador que actúan como disparadores (triggers):

>EV_BTN_HOLD: Se detecta que el botón está en posición "presionado" (circuito cerrado o cambio de nivel lógico).

>EV_BTN_FREE: Se detecta que el botón está en posición "no presionado" o libre (circuito abierto).

Temporización y Variables de Control (timer => tick):  
Dado que el módulo de código C ejecuta una actualización por tiempo (Update by Time Code) con un período de 1 mS, el sistema utiliza esto como base de tiempos:

after 50ms: Actúa como la condición o guardia (guard) para confirmar que el estado mecánico se ha estabilizado. En la implementación en C, esto significa que el sistema acumulará 50 ciclos (ticks de 1 mS) manteniendo el mismo estado físico antes de dar la transición por válida.

Acciones y Señales del Sistema (signal => EV_SYS_NAME):  
Las acciones se ejecutan automáticamente al ingresar (entry /) a los estados estables confirmados. Estas acciones se encargan de generar los eventos depurados que el módulo "System" (encargado de procesar) consumirá:

>raise EV_SYS_OFF: Se dispara al entrar a ST_BTN_UP. Le notifica al sistema que el botón está inequívocamente suelto.

>raise EV_SYS_ON: Se dispara al entrar a ST_BTN_DOWN. Le notifica al sistema que el botón fue presionado de forma estable y sostenida.

Dinámica del Modelo (Cómo funciona el Anti-rebote):  
Presionando el botón:  
Estando en ST_BTN_UP, el usuario presiona el botón. Se genera EV_BTN_HOLD y el estado pasa a ST_BTN_FALL. Inicia el conteo de tiempo.

>Si hay rebote: Los contactos vibran, abriendo el circuito. Se lee un falso EV_BTN_FREE. El modelo cancela el conteo y regresa a ST_BTN_UP protegiendo al sistema de una lectura errónea.

>Si es estable: Pasan 50 ms (after 50ms) sin interrupciones. El modelo avanza a ST_BTN_DOWN y ejecuta la acción raise EV_SYS_ON, validando la presión.

Soltando el botón:  
Estando en ST_BTN_DOWN, el usuario suelta el botón. Se detecta EV_BTN_FREE y se pasa a ST_BTN_RISE, iniciando el temporizador.

>Si hay rebote: Los contactos vibran cerrando el circuito brevemente. Se lee EV_BTN_HOLD. El modelo vuelve a ST_BTN_DOWN.

>Si es estable: Pasan 50 ms (after 50ms) confirmando la liberación. El modelo regresa a ST_BTN_UP y ejecuta raise EV_SYS_OFF.


### Sensor Statechart - State Transition Table

| Current State | Event | [Guard] | Next State | Actions |
| :--- | :--- | :--- | :--- | :--- |
| `ST_BTN_UP`   | `EV_BTN_HOLD` | | `ST_BTN_FALL` | `timer = 0` |
| `ST_BTN_FALL` | `EV_BTN_FREE` | | `ST_BTN_UP`   | |
| `ST_BTN_FALL` | `tick`        | `[timer >= 50]` | `ST_BTN_DOWN` | `raise EV_SYS_ON` |
| `ST_BTN_DOWN` | `EV_BTN_FREE` | | `SR_BTN_RISE` | `timer = 0` |
| `SR_BTN_RISE` | `EV_BTN_HOLD` | | `ST_BTN_DOWN` | |
| `SR_BTN_RISE` | `tick`        | `[timer >= 50]` | `ST_BTN_UP`   | `raise EV_SYS_OFF` |

---
*Nota de implementación: Se asume `tick` como el evento del ejecutivo cíclico que ocurre cada 1mS. El temporizador se inicializa (`timer = 0`) en las transiciones hacia los estados transitorios. Las acciones de `entry` del modelo gráfico (`raise EV_SYS_ON` y `raise EV_SYS_OFF`) se asientan aquí como las acciones ejecutadas durante las transiciones hacia los estados estables una vez superada la guardia de los 50ms.*
