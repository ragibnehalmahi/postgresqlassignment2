CREATE DATABASE conservation_db;
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) 
);
INSERT INTO rangers (name,region) VALUES
('Alice Green' ,'Northern Hills' ),
('Bob White'   ,      'River Delta'  ) ,
('Carol King'   ,    ' Mountain Range' );
SELECT * FROM rangers;

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name   VARCHAR(100) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(20) check (conservation_status IN ('Endangered','Vulnerable'))

);

 

 INSERT INTO species ( common_name  ,scientific_name  ,discovery_date,conservation_status ) VALUES
('Snow Leopard ' ,'Panthera uncia   ' ,'1775-01-01 ','Endangered'),
(' Bengal Tiger  ' ,'Panthera tigris tigris    ' ,' 1758-01-01  ','Endangered'),
('Red Panda    ' ,'Ailurus fulgens ' ,' 1825-01-01  ','Vulnerable'),
(' Asiatic Elephant' ,'Elephas maximus indicus   ' ,'  1758-01-01     ','Endangered');
 
SELECT * FROM species;

CREATE TABLE sightings(
    sightings_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id),
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes VARCHAR(100) 
     );
     INSERT INTO sightings(species_id,ranger_id,location,sighting_time,notes    ) VALUES
        (1 , 1  ,'Peak Ridge'  ,'2024-05-10 07:45:00','Camera trap image captured '),
         (2 , 2  ,'Bankwood Area '  ,'2024-05-12 16:20:00','Juvenile seen '),
          (3, 3 ,'Bamboo Grove East '  ,' 2024-05-15 09:10:00 ','Feeding observed'),
         (1 , 2  ,'Snowfall Pass '  ,'2024-05-18 18:30:00','');
         SELECT * FROM sightings;
 
 DROP TABLE if sightings EXISTS;
 --1no solution
 INSERT INTO rangers (name,region) 
 VALUES('Derek Fox', 'Coastal Plains');
 SELECT * FROM rangers;
 --2no solution
 SELECT COUNT(*) AS unique_species
 FROM(
    SELECT species_id FROM sightings GROUP BY species_id
 ) AS grouped_species;
 
--3no solution
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

--4no solution
 SELECT 
  rangers.name,
  COUNT(sightings.sightings_id) AS total_sightings
FROM 
  rangers
LEFT JOIN 
  sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY 
  rangers.name;

  --5no solution
  SELECT common_name,scientific_name FROM species
  WHERE species_id NOT IN(
    SELECT DISTINCT species_id FROM sightings WHERE species_id IS NOT NULL
  );

--6no solution
SELECT
 species.common_name,
 sightings.sighting_time,rangers.name FROM sightings
 JOIN species ON sightings.species_id = species.species_id
 JOIN rangers ON sightings.ranger_id = rangers.ranger_id
 ORDER BY sightings.sighting_time DESC
 LIMIT 2;

  --7no solutin
  ALTER TABLE species
  DROP constraint species_conservation_status_check;
  ALTER TABLE species
  ADD constraint species_conservation_status_check
  CHECK (conservation_status IN ('Endagered','Vulnerable','Historic'));
  UPDATE species
  SET conservation_status = 'Historic'
  WHERE discovery_date < '1800-01-01';
   SELECT * FROM species;

--8no solution
SELECT sightings_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) <12 THEN 'Morning'
    WHEN EXTRACT (HOUR FROM sighting_time) BETWEEN  12 AND 17 THEN 'Afternoon'
    
    ELSE  'Evening'
    END AS time_of_day
    FROM sightings;

    --9no solution
    DELETE FROM rangers
    WHERE ranger_id NOT IN(
        SELECT DISTINCT ranger_id
        FROM sightings
    )
    --