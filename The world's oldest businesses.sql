-- Select the oldest and newest founding years from the businesses table

SELECT MIN(year_founded), MAX(year_founded)
    FROM businesses;


-- Get the count of rows in businesses where the founding year was before 1000
SELECT COUNT(*)
FROM businesses
WHERE year_founded < 1000;


-- Select all columns from businesses where the founding year was before 1000
-- Arrange the results from oldest to newest
SELECT*
FROM businesses
WHERE year_founded < 1000
ORDER BY year_founded ASC;


-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest

SELECT business, year_founded, b.country_code, c.category
FROM businesses as b
INNER JOIN categories as c 
ON c.category_code = b.category_code
WHERE year_founded < 1000
GROUP BY category, business
ORDER BY year_founded;


-- Select the category and count of category (as "n")
-- arranged by descending count, limited to 10 most common categories

SELECT category, COUNT(category) as n
FROM categories as c
JOIN businesses as b
ON b.category_code = c.category_code
GROUP BY c.category
ORDER BY n DESC
LIMIT 10;


-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest 


SELECT MIN(year_founded) as oldest, c.continent
    FROM businesses as b
    INNER JOIN countries as c
        ON b.country_code = c.country_code
    GROUP BY continent
    ORDER BY oldest;


-- Select the business, founding year, category, country, and continent

SELECT business, year_founded, category, country, continent
    FROM businesses as bu
        INNER JOIN categories as ca
            ON bu.category_code = ca.category_code
        INNER JOIN countries as co 
            ON bu.country_code = co.country_code


-- Count the number of businesses in each continent and category

SELECT continent, category, COUNT(business) as n
    FROM categories as ca
        INNER JOIN businesses as bu
            ON bu.category_code = ca.category_code
        INNER JOIN countries as co 
            ON bu.country_code = co.country_code
            GROUP BY category, continent
            ORDER BY category;


-- Repeat that previous query, filtering for results having a count greater than 5

SELECT continent, category, COUNT(business) as n
    FROM businesses as bu
        INNER JOIN categories as ca
            ON bu.category_code = ca.category_code
        INNER JOIN countries as co 
            ON bu.country_code = co.country_code
            GROUP BY category, continent
            HAVING COUNT(business) > 5
            ORDER BY n DESC;