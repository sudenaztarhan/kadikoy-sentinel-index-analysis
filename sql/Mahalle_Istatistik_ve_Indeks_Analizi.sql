SELECT
    m.neighborhood_name,

    ST_SummaryStats(
        ST_Clip(ndvi.rast, m.geom)
    ).mean AS mean_ndvi,

    ST_SummaryStats(
        ST_Clip(ndbi.rast, m.geom)
    ).mean AS mean_ndbi,

    ST_SummaryStats(
        ST_Clip(ndwi.rast, m.geom)
    ).mean AS mean_ndwi,

    ST_SummaryStats(
        ST_Clip(savi.rast, m.geom)
    ).mean AS mean_savi

FROM neighborhood_data AS m

LEFT JOIN ndvi_raster AS ndvi
    ON ST_Intersects(ndvi.rast, m.geom)

LEFT JOIN ndbi_raster AS ndbi
    ON ST_Intersects(ndbi.rast, m.geom)

LEFT JOIN ndwi_raster AS ndwi
    ON ST_Intersects(ndwi.rast, m.geom)

LEFT JOIN savi_raster AS savi
    ON ST_Intersects(savi.rast, m.geom)

GROUP BY
    m.neighborhood_name,
    m.geom,
    ndvi.rast,
    ndbi.rast,
    ndwi.rast,
    savi.rast

ORDER BY
    mean_ndvi DESC;