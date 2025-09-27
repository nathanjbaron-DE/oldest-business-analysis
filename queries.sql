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
