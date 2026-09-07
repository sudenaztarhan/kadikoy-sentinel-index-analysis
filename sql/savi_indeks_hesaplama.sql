CREATE TABLE kadikoy_savi_raster AS
SELECT 
    b8.rid,
    ST_MapAlgebra(
        ST_Resample(b8.rast, b4.rast), 1, 
        b4.rast, 1, 
        '((([rast1] - [rast2])::float / NULLIF(([rast1] + [rast2] + 0.5)::float, 0)) * 1.5)::float', 
        '32BF'
    ) AS rast
FROM kadikoy_b08 b8
JOIN kadikoy_b04 b4 ON b8.rid = b4.rid;
CREATE INDEX idx_kadikoy_savi_rast ON kadikoy_savi_raster USING gist (ST_ConvexHull(rast));
SELECT AddRasterConstraints('public'::name, 'kadikoy_savi_raster'::name, 'rast'::name);