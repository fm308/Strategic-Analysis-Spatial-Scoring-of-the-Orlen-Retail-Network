CREATE TABLE orlen_score_results AS
WITH scoring AS (
    SELECT 
        *,
        
        -- 1. POSITIVE: Proximity to Major Roads (Primary Traffic Drivers)
        CASE 
            WHEN distance_to_road <= 1.0 THEN 4  
            WHEN distance_to_road <= 3.0 THEN 2  
            ELSE 0 
        END AS score_highways,

        -- 2. POSITIVE: Retail Synergy (Proximity to Shopping Malls)
        CASE 
            WHEN distance_to_malls <= 1.0 THEN 2
            WHEN distance_to_malls <= 2.5 THEN 1
            ELSE 0 
        END AS score_malls,

        -- 3. RISK: Road Isolation (Distance from major transit corridors)
        -- Penalty for sites that are 'hidden' from main traffic routes
        CASE 
            WHEN distance_to_road > 5.0 THEN -3 
            WHEN distance_to_road > 3.0 THEN -1
			ELSE 0
        END AS score_road_isolation,

        -- 4. COMPETITION: Direct Rivalry (Immediate Price Pressure)
        CASE 
            WHEN min_dist_top3_km <= 0.5 THEN -2 
            WHEN min_dist_top3_km <= 1.5 THEN -1 
            ELSE 0 
        END AS score_competition_min,

        -- 5. MARKET: Saturation (Cluster Pressure from Top 3 Rivals)
        CASE 
            WHEN avg_dist_top3_km <= 3.0 THEN -1 
            ELSE 0 
        END AS score_market_saturation

    FROM orlen_final
)
SELECT 
    *,
    -- Final calculation of the strategic score
    (score_highways + score_malls + score_road_isolation + score_competition_min + score_market_saturation) AS total_potential_score,
    
    -- Strategic Business Segmentation
    CASE 
        WHEN (score_highways + score_malls + score_road_isolation + score_competition_min + score_market_saturation) >= 4 THEN 'Star (High Growth)'
        WHEN (score_highways + score_malls + score_road_isolation + score_competition_min + score_market_saturation) BETWEEN 1 AND 3 THEN 'Solid Performer'
        WHEN (score_highways + score_malls + score_road_isolation + score_competition_min + score_market_saturation) = 0 THEN 'Neutral / Stable'
        ELSE 'Underperforming / High Risk'
    END AS business_segment
FROM scoring;

