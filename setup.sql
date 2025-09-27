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

-- Import CSV files
.mode csv
.import ./data/countries.csv countries
.import ./data/businesses.csv businesses
.import ./data/categories.csv categories
