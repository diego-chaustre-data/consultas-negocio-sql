-- Pregunta de negocio: ¿Quiénes son los conductores mejor calificados?
-- Uso en el negocio: premiar a los mejores. HAVING descarta a quienes tienen pocas calificaciones para que el ranking sea justo.

SELECT p.full_name       AS conductor,
       d.tier            AS nivel,
       COUNT(r.id)       AS calificaciones,
       ROUND(AVG(r.stars), 2) AS promedio
FROM ratings r
JOIN profiles p ON p.id = r.to_id
JOIN drivers  d ON d.profile_id = p.id
GROUP BY p.id, p.full_name, d.tier   -- PostgreSQL exige agrupar por todo lo que se muestra
HAVING COUNT(r.id) >= 5
ORDER BY promedio DESC, calificaciones DESC
LIMIT 5;
