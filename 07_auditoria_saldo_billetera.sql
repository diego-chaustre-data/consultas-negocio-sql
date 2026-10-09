-- Pregunta de negocio: Auditoría: ¿cuadra el saldo de la billetera movimiento a movimiento?
-- Uso en el negocio: control financiero. Como la billetera es de solo inserción, una función de ventana reconstruye el saldo y lo compara con el guardado.

SELECT id,
       created_at,
       type          AS tipo,
       amount        AS monto_cop,
       balance_after AS saldo_guardado,
       SUM(amount) OVER (ORDER BY id) AS saldo_recalculado,
       CASE WHEN balance_after = SUM(amount) OVER (ORDER BY id)
            THEN 'cuadra' ELSE 'REVISAR' END AS control
FROM wallet_transactions
WHERE driver_id = 3
ORDER BY id
LIMIT 15;
