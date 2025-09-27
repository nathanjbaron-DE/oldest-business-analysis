# World’s Oldest Businesses Analysis (SQLite, SQL)

## Overview
This project analyzes global business longevity by querying relational data to identify the oldest businesses on each continent. It also detects missing data and explores which business categories are most likely to survive for centuries.

The project uses SQLite and CSV files, so no database setup or Python is required

## Features
- Identify the oldest business per continent  
- Count countries missing oldest business data  
- Analyze business categories with the longest lifespan  
- Validate dataset completeness  

## Tech Stack
- SQLite for lightweight, file-based relational data  
- SQL for querying and aggregating data  
- CSV files as input datasets  

## Files
- `setup.sql` - SQL setup before quering data
- `queries.sql` – SQL queries to extract insights  
- `data/` – Sample CSV datasets  
  - `countries.csv`  
  - `businesses.csv`  
  - `categories.csv`  
- `README.md` – Project documentation  

## How to Run
### 1. Clone the Project
``` cd ~/Documents

# Clone GitHub repository
git clone https://github.com/nathanjbaron-DE/oldest-businesses-analysis.git

# Go into the project folder
cd oldest-businesses-analysis
```

### 2. Install SQLite
```
# Mac
brew install sqlite

# Windows
# Download installer from https://www.sqlite.org/download.html

# Linux
sudo apt install sqlite3
```

### 3. Create SQLite Database
```
cd ~/Documents/oldest-businesses-analysis
sqlite3 oldest_businesses.db
```

### 4. Import CSV Files into SQLite
```
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
```

### 5. Run SQL Queries
```
-- Oldest business per continent
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
SELECT c.continent, COUNT(c.country) AS countries_without_businesses
FROM countries c
LEFT JOIN businesses b ON c.country_code = b.country_code
WHERE b.business IS NULL
GROUP BY c.continent;

-- Longest lasting business categories
SELECT c.continent, cat.category, MIN(b.year_founded) AS year_founded
FROM countries c
JOIN businesses b ON b.country_code = c.country_code
JOIN categories cat ON cat.category_code = b.category_code
GROUP BY c.continent, cat.category
ORDER BY c.continent, cat.category;
```

### 6. Exit SQLite
```
.exit
```

