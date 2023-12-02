-- ENCONTRAR LAS ESTACIONES DE TREN QUE ESTAN CONTENIDAS EN "WEST VILLAGE" POR BLOQUES

SELECT name, 
       ST_Transform(geom, 4326)
FROM nyc_neighborhoods;

SELECT
	 nyc_subway_stations.name AS subway_name,
	 nyc_neighborhoods.name AS neighborhood_name,
	 nyc_neighborhoods.boroname AS borough
FROM nyc_neighborhoods
JOIN nyc_subway_stations 
ON ST_Contains(nyc_neighborhoods.geom, nyc_subway_stations.geom)
WHERE nyc_neighborhoods.name = 'West Village';

SELECT
	 nyc_subway_stations.name AS subway_name,
	 nyc_neighborhoods.name AS neighborhood_name,
	 nyc_neighborhoods.boroname AS borough,
	 nyc_census_blocks.boroname AS block
FROM nyc_neighborhoods
JOIN nyc_subway_stations 
ON ST_Contains(nyc_neighborhoods.geom, nyc_subway_stations.geom)
JOIN nyc_census_blocks 
ON ST_Contains(nyc_census_blocks.geom, nyc_subway_stations.geom)
WHERE nyc_neighborhoods.name = 'West Village';

SELECT
	 nyc_subway_stations.name AS subway_name,
	 nyc_neighborhoods.name AS neighborhood_name,
	 nyc_neighborhoods.boroname AS borough
FROM nyc_neighborhoods
JOIN nyc_subway_stations
ON nyc_neighborhoods.geom && nyc_subway_stations.geom
WHERE nyc_neighborhoods.name = 'West Village';

SELECT
	 nyc_subway_stations.name AS subway_name,
	 nyc_neighborhoods.name AS neighborhood_name,
	 nyc_neighborhoods.boroname AS borough,
	 ST_Transform(nyc_subway_stations.geom, 4326) AS transformed_geom
FROM nyc_neighborhoods
JOIN nyc_subway_stations 
ON ST_Contains(nyc_neighborhoods.geom, nyc_subway_stations.geom)
WHERE nyc_neighborhoods.name = 'West Village';

SELECT
	 nyc_subway_stations.name AS subway_name,
	 nyc_neighborhoods.name AS neighborhood_name,
	 nyc_neighborhoods.boroname AS borough,
	 ST_Transform(nyc_neighborhoods.geom, 4326) AS transformed_neighborhood_geom,
	 ST_Transform(nyc_subway_stations.geom, 4326) AS transformed_subway_geom
FROM nyc_neighborhoods
JOIN nyc_subway_stations 
ON ST_Contains(nyc_neighborhoods.geom, nyc_subway_stations.geom)
WHERE nyc_neighborhoods.name = 'West Village';


SELECT
	 stations.name AS subway_name,
	 neighborhoods.name AS neighborhood_name,
	 neighborhoods.boroname AS borough,
	 ST_AsText(ST_Transform(stations.geom, 4326)) AS transformed_subway_geom,
	 ST_AsText(ST_Transform(neighborhoods.geom, 4326)) AS transformed_neighborhood_geom
FROM nyc_subway_stations stations
JOIN nyc_neighborhoods neighborhoods
ON stations.geom && neighborhoods.geom
WHERE neighborhoods.name = 'West Village';
