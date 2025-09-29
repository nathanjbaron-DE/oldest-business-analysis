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
- SQLite
- SQL for querying and aggregating data  
- CSV files as input datasets  

## Files
- `run_all.sql` - Imports CSV Files, runs SQL queries, and outputs as CSVs
- `data/` – CSV datasets  
  - `countries.csv`  
  - `businesses.csv`  
  - `categories.csv`  
- `README.md` – Project documentation  

## How to Run
### 1. Clone the Project
```
cd ~/Documents
```
```
# Clone GitHub repository
git clone https://github.com/nathanjbaron-DE/oldest-business-analysis.git

# Go into the project folder
cd oldest-business-analysis
```

### 2. Install SQLite
#### Mac
```
brew install sqlite
```

#### Windows
##### Download installer from 
```
https://www.sqlite.org/download.html
```

#### Linux
```
sudo apt install sqlite3
```

### 3. Create SQLite Database
```
cd ~/Documents/oldest-business-analysis
sqlite3 oldest_businesses.db
```

### 4. Run SQL file
```
.read run_all.sql
```

### 5. Exit SQLite
```
.exit
```

