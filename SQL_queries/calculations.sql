CREATE TABLE orlen_final AS
WITH orlen_base AS (
    SELECT
        fid,
        address,
        geom,
        ROUND(ST_Y(ST_Transform(geom, 4326))::numeric, 6) as lat,
        ROUND(ST_X(ST_Transform(geom, 4326))::numeric, 6) as lon
    FROM orlen_master

), closest_competitor_info AS (
    -- Name of the nearest competitor
    SELECT
        o.fid,
        near.title AS closest_competitor
    FROM orlen_master o
    CROSS JOIN LATERAL (
        SELECT title
        FROM moya_mol_merge
        ORDER BY o.geom <-> geom
        LIMIT 1
    ) near

), competition_stats_top3 AS (
    -- Calculation Min, Max and avg distance for the top 3 competitions
    SELECT 
        o.fid,
        ROUND(MIN(near3.dist)::numeric, 3) AS min_dist_top3_km,
        ROUND(MAX(near3.dist)::numeric, 3) AS max_dist_top3_km,
        ROUND(AVG(near3.dist)::numeric, 3) AS avg_dist_top3_km
    FROM orlen_master o
    CROSS JOIN LATERAL (
        SELECT (ST_Distance(o.geom, geom) / 1000) AS dist
        FROM moya_mol_merge
        ORDER BY o.geom <-> geom
        LIMIT 3
    ) near3
    GROUP BY o.fid

), positive_factors AS (
    SELECT 
        o.fid,
        ROUND((ST_Distance(o.geom, r.geom) / 1000)::numeric, 3) as distance_to_road,
        ROUND((ST_Distance(o.geom, m.geom) / 1000)::numeric, 3) as distance_to_malls
    FROM orlen_master o
    CROSS JOIN LATERAL (
        SELECT geom FROM roads ORDER BY o.geom <-> geom LIMIT 1
    ) r
    CROSS JOIN LATERAL (
        SELECT geom FROM shop_malls ORDER BY o.geom <-> geom LIMIT 1
    ) m

), negative_factors AS (
    SELECT 
        o.fid,
        ROUND((ST_Distance(o.geom, s.geom) / 1000)::numeric, 3) as distance_to_schools
    FROM orlen_master o
    CROSS JOIN LATERAL (
        SELECT geom FROM schools ORDER BY o.geom <-> geom LIMIT 1
    ) s
)

SELECT 
    a.address,
    c.closest_competitor,
    b.min_dist_top3_km,
    b.max_dist_top3_km,
    b.avg_dist_top3_km,
    d.distance_to_road,
    d.distance_to_malls,
    e.distance_to_schools,
    a.lat,
    a.lon,
    a.geom
FROM orlen_base a
LEFT JOIN competition_stats_top3 b ON a.fid = b.fid
LEFT JOIN closest_competitor_info c ON a.fid = c.fid
LEFT JOIN positive_factors d ON a.fid = d.fid
LEFT JOIN negative_factors e ON a.fid = e.fid
ORDER BY a.fid;

DROP TABLE orlen_final
