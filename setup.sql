-- Drop tables if they exist
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS businesses;
DROP TABLE IF EXISTS categories;

-- Create tables
CREATE TABLE countries (
    country_code TEXT PRIMARY KEY,
    country TEXT,
    continent TEXT
);

CREATE TABLE businesses (
    business TEXT,
    country_code TEXT,
    year_founded INTEGER,
    category_code TEXT
);

CREATE TABLE categories (
    category_code TEXT PRIMARY KEY,
    category TEXT
);

-- Import CSVs (headers included as first row)
.mode csv
.import ./data/countries.csv countries
.import ./data/businesses.csv businesses
.import ./data/categories.csv categories

-- Remove header rows after import
DELETE FROM countries WHERE country_code = 'country_code';
DELETE FROM businesses WHERE business = 'business';
DELETE FROM categories WHERE category_code = 'category_code';
