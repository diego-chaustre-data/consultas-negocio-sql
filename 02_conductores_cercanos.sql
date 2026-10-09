-- Pregunta de negocio: ¿Qué conductores disponibles hay a menos de 3 km del Parque Santander?
-- Uso en el negocio: es la consulta que asigna un viaje. Réplica en SQLite de mi función nearby_drivers() de PostgreSQL, con la fórmula de Haversine registrada como función.

-- Parque Santander: 7.8833, -72.5053
SELECT p.full_name    AS conductor,
       d.vehicle_type AS vehiculo,
       d.tier         AS nivel,
       ROUND(haversine(7.8833, -72.5053,
             d.current_lat, d.current_lng), 2) AS distancia_km
FROM drivers d
JOIN profiles p ON p.id = d.profile_id
WHERE d.status = 'available'
  AND haversine(7.8833, -72.5053, d.current_lat, d.current_lng) <= 3
ORDER BY distancia_km;
