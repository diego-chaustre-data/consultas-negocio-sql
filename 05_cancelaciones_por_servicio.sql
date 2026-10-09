-- Pregunta de negocio: ¿Qué tipo de servicio tiene más cancelaciones?
-- Uso en el negocio: encontrar dónde se pierden clientes. Combina agregación condicional con CASE.

SELECT service_type AS servicio,
       COUNT(*)     AS total,
       SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS canceladas,
       ROUND(100.0 * SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END)
             / COUNT(*), 1) AS tasa_pct
FROM trips
GROUP BY service_type
ORDER BY tasa_pct DESC;
