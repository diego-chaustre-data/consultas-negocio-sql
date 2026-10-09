-- Pregunta de negocio: ¿Cuánto factura la plataforma según el nivel del conductor?
-- Uso en el negocio: comprobar que el programa de niveles funciona: a mejor nivel, menor comisión para el conductor.

SELECT d.tier                   AS nivel,
       COUNT(*)                 AS viajes,
       SUM(t.fare_final)        AS facturado_cop,
       SUM(t.commission_amount) AS comision_cop,
       ROUND(100.0 * SUM(t.commission_amount)
             / SUM(t.fare_final), 1) AS comision_pct
FROM trips t
JOIN drivers d ON d.id = t.driver_id
WHERE t.status = 'completed'
GROUP BY d.tier
ORDER BY comision_pct DESC;
