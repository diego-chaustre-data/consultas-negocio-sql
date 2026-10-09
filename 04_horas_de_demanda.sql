-- Pregunta de negocio: ¿A qué horas hay más demanda de viajes?
-- Uso en el negocio: decidir cuándo ofrecer bonos para tener más conductores en línea.

SELECT strftime('%H:00', requested_at) AS hora,
       COUNT(*)                         AS solicitudes,
       ROUND(AVG(fare_final))           AS tarifa_promedio_cop
FROM trips
GROUP BY hora
ORDER BY solicitudes DESC
LIMIT 6;
