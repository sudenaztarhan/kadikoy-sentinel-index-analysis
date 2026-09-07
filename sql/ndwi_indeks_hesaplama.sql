CREATE TABLE kadikoy_ndwi_raster AS
SELECT 
    b8.rid,
    ST_MapAlgebra(
        b3.rast, 1, 
        b8.rast, 1, 
        '(([rast1] - [rast2])::float / NULLIF(([rast1] + [rast2])::float, 0))::float', 
        '32BF'
    ) AS rast
FROM kadikoy_b03 b3
JOIN kadikoy_b08 b8 ON b3.rid = b8.rid;
CREATE INDEX idx_kadikoy_ndwi_rast ON kadikoy_ndwi_raster USING gist (ST_ConvexHull(rast));
SELECT AddRasterConstraints('public'::name, 'kadikoy_ndwi_raster'::name, 'rast'::name);