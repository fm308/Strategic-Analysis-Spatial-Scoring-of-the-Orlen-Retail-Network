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

## Visualizations

<img width="3507" height="2480" alt="heatmap_last_ver" src="https://github.com/user-attachments/assets/0efd9e8f-ba54-4afb-9846-c02313d02282" />
<p><i>Fig. 1: Regional Market Density (Heatmap) for Orlen gas stations.</i></p>

<img width="3507" height="2480" alt="heatmap_moya_mol" src="https://github.com/user-attachments/assets/0da58ff4-3ed3-4636-8a83-7062ffe9ddde" />
<p><i>Fig. 2: Regional Market Density (Heatmap) for competition Moya and MOL.</i></p>

<img width="3507" height="2480" alt="orlen_slajd2" src="https://github.com/user-attachments/assets/0d588b3b-30ee-419b-964f-fd0004721a18" />
<img width="2624" height="1361" alt="wykres_slajd2" src="https://github.com/user-attachments/assets/a3ed6379-675a-4307-9729-3e75b66d9bba" />
<p><i>Fig. 3: Competitive Exposure with statistical chart.</i></p>

<img width="3507" height="2480" alt="slajd3" src="https://github.com/user-attachments/assets/d0d8f58f-bdf8-4e40-87f7-a5a200182493" />
<img width="2392" height="1280" alt="wykres_slajd3" src="https://github.com/user-attachments/assets/a0ff5f5b-6c41-42c9-aeb9-a1ae2bff9515" />
<p><i>Fig. 3: Strategic Scoring Map with statistical chart.</i></p>

