-- Este archivo crea una vista de resumen de ventas
CREATE OR REPLACE VIEW ventas_resumen_rapido AS
SELECT
    EXTRACT(YEAR FROM fecha_venta) AS anio,
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    canal_venta,
    SUM(cantidad * precio_unitario * (1 - descuento_pct)) AS total_ingresos
FROM ventas
GROUP BY 1, 2, 3
ORDER BY anio, mes;
