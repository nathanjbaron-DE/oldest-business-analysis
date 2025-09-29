-- ======================
-- Setup: Create Tables
-- ======================

DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS businesses;
DROP TABLE IF EXISTS categories;

CREATE TABLE countries (
    country_code TEXT PRIMARY KEY,
    country TEXT,
    continent TEXT
);

CREATE TABLE businesses (
    business TEXT,
    year_founded INTEGER,
    category_code TEXT,
    country_code TEXT
);

CREATE TABLE categories (
    category_code TEXT PRIMARY KEY,
    category TEXT
);

-- ======================
-- Import Data
-- ======================

.mode csv
.import ./data/countries.csv countries
.import ./data/businesses.csv businesses
.import ./data/categories.csv categories

-- Remove header rows from imports
DELETE FROM countries WHERE country_code = 'country_code';
DELETE FROM businesses WHERE business = 'business';
DELETE FROM categories WHERE category_code = 'category_code';

-- ======================
-- Queries with Output
-- ======================

.headers on
.mode csv

-- Oldest business per continent
.output oldest_businesses.csv
SELECT c.continent, c.country, b.business, b.year_founded
FROM countries c
JOIN businesses b ON c.country_code = b.country_code
WHERE b.year_founded = (
    SELECT MIN(b2.year_founded)
    FROM businesses b2
    JOIN countries c2 ON b2.country_code = c2.country_code
    WHERE c2.continent = c.continent
);

-- Countries missing business data
.output countries_missing_businesses.csv
SELECT c.continent, COUNT(c.country) AS countries_without_businesses
FROM countries c
LEFT JOIN businesses b ON c.country_code = b.country_code
WHERE b.business IS NULL
GROUP BY c.continent;

-- Longest lasting categories
.output longest_lasting_categories.csv
SELECT c.continent, cat.category, MIN(b.year_founded) AS year_founded
FROM countries c
JOIN businesses b ON b.country_code = c.country_code
JOIN categories cat ON cat.category_code = b.category_code
GROUP BY c.continent, cat.category
ORDER BY c.continent, cat.category;

-- Reset output
.output stdout
