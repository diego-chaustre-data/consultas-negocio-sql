# Consultas de negocio en SQL · Diego Chaustre

Seis preguntas reales de negocio respondidas con SQL sobre una réplica de la base de datos de **ALIS** (app de movilidad), con datos de prueba ficticios de Cúcuta.

> **Cómo se hicieron:** las consultas las redacté con apoyo de inteligencia artificial y las revisé una por una, comprobando que el resultado tuviera sentido para el negocio. Mi SQL escrito a mano, con mis errores y correcciones, está en [practicas-sql](https://github.com/diego-chaustre-data/practicas-sql).
>
> Puedes ejecutarlas en vivo, en el navegador, en el **laboratorio SQL** de mi [portafolio](https://diego-chaustre-data.github.io).

## Las preguntas

| # | Pregunta | Qué uso de SQL muestra |
|---|---|---|
| [02](02_conductores_cercanos.sql) | ¿Qué conductores disponibles hay a menos de 3 km? | `JOIN`, función de distancia (Haversine) |
| [03](03_facturacion_por_nivel.sql) | ¿Cuánto factura la plataforma por nivel de conductor? | `GROUP BY`, `SUM`, porcentajes |
| [04](04_horas_de_demanda.sql) | ¿A qué horas hay más demanda? | Fechas, `COUNT`, `AVG`, `LIMIT` |
| [05](05_cancelaciones_por_servicio.sql) | ¿Qué servicio tiene más cancelaciones? | Agregación condicional con `CASE` |
| [06](06_mejores_conductores.sql) | ¿Quiénes son los mejores conductores? | `HAVING` para un ranking justo |
| [07](07_auditoria_saldo_billetera.sql) | **Auditoría: ¿cuadra el saldo movimiento a movimiento?** | Función de ventana `SUM() OVER` |

## Por qué me interesa la auditoría (07)

La billetera de los conductores es **de solo inserción**: los movimientos nunca se editan ni se borran. Así, una consulta puede recalcular el saldo desde cero y compararlo con el saldo guardado, marcando `REVISAR` cualquier diferencia. Es el mismo principio de una conciliación contable, algo que hice en Excel durante años y que quiero aplicar en el sector financiero.

El esquema está en [01_esquema.sql](01_esquema.sql).

**Diego Chaustre** · Aprendiz SENA, Tecnólogo en Implementación y Gestión de Bases de Datos · Busco patrocinio SENA · diego.chaustre.data@gmail.com
