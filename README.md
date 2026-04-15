# Strategic Analysis Spatial Scoring of the Orlen Retail Network
---


## Project description: 
The project provided a comprehensive assessment of the spatial potential for the Orlen gas station network in the Pomeranian Voivodeship. 
It encompassed the entire data lifecycle: from automated data acquisition (Web Scraping) and advanced spatial modeling in PostGIS to the 
development of a custom MCDA (Multi-Criteria Decision Analysis) scoring model. The analysis enabled strategic network segmentation based on market risk and growth potential,
incorporating business drivers (shopping malls, high-capacity road networks) and constraints (competitor proximity and lack of access to major transit routes).

## Technologies & Tools
- **GIS & Databases**: PostgreSQL/PostGIS (proximity analysis), QGIS.
- **Data Engineering**: Python, Pandas (ETL, data cleaning, schema standardization).
- **Data Acquisition**: Apify (Web Scraping), OpenStreetMap (OSM).
- **Analytics**: MCDA (Multi-Criteria Decision Analysis), KDE (Kernel Density Estimation).

## Key results 
- Advanced SQL Analytics: Developed complex SQL queries to calculate station coordinates and determine minimum, maximum, and average distances to the top 3 nearest competitors (MOL, Moya). Built an automated scoring algorithm that awards points for proximity to traffic generators and deducts points for competitive pressure or significant distance from high-capacity road networks.
- Figs. 1 & 2: Regional Market Density (Heatmap): Applied Kernel Density Estimation (KDE) to visualize Orlen’s regional market dominance and identify areas with the highest service saturation.
- Fig. 3: Competitive Exposure: A spatial statistical overview illustrating the average distance to the nearest rivals, providing a quantitative assessment of market pressure on specific network assets.
- Fig. 4: Strategic Scoring Map: The final output of the MCDA model, featuring automated network segmentation into four strategic tiers: Strategic Stars, Solid Performers, Neutral, and High Risk.


<img width="3507" height="2480" alt="heatmap_moya_mol" src="https://github.com/user-attachments/assets/0656fd23-bcf7-4b99-ad6b-d79c6a442b81" />
[cite_start]*Fig. 1: Regional Market Density (Heatmap) for Orlen gas stations.* [cite: 69, 70]
