#1
SELECT country.`Name`, country.SurfaceArea
FROM country
WHERE country.SurfaceArea > 1000000;

# 2
select city.`Name`, city.Population
FROM city
WHERE city.Population BETWEEN 500000 AND 1000000

# 3
select country.name
FROM country
WHERE country.LifeExpectancy IS NULL

# 4
select country.name, country.Continent, country.GNP
FROM country
WHERE country.Continent = "Africa" AND country.GNP < 10000

# 5
SELECT city.`Name`
FROM city
WHERE city.`Name` LIKE "M%"
ORDER BY `Name` DESC

# 6
SELECT country.`Name`, country.SurfaceArea
FROM country
WHERE country.SurfaceArea > (select AVG(country.SurfaceArea) FROM country);

# 7
SELECT country.`Name`, country.Population
FROM country
ORDER BY country.Population DESC
LIMIT 5;

SELECT country.`Name`, country.GNP
FROM country
WHERE char_length(country.`Name`) > 10 AND country.GNP < 50000;

# 9
SELECT city.`Name`, city.Population
FROM city
WHERE city.Population > (SELECT AVG(city.Population) FROM city)
ORDER BY city.Population DESC

# 10
SELECT country.`Name`, country.LifeExpectancy, country.GNP
FROM country
WHERE country.LifeExpectancy >70 OR country.GNP <5000 AND country.LifeExpectancy IS NOT NULL

# 11
SELECT country.`Name`, country.Population, country.Population / country.SurfaceArea
FROM country
WHERE country.Population / country.SurfaceArea > 100
ORDER BY country.Population / country.SurfaceArea DESC

# 12
SELECT country.`Name`
FROM country
WHERE country.`Name` LIKE "a%" OR country.`Name` LIKE "e%" OR country.`Name` LIKE "i%"

# 13
SELECT city.`Name`, city.Population
FROM city
WHERE char_length(city.`Name`)<5 AND city.Population>10000
ORDER BY city.`Name` ASC

# 14
SELECT country.Continent, (SELECT COUNT(country.`Name`))
FROM country
GROUP BY country.Continent
HAVING COUNT(country.`Name`) > 10

# 15
SELECT country.`Name`
FROM country
JOIN countrylanguage
ON countrylanguage.CountryCode = country.`Code`
WHERE countrylanguage.`Language` = "English" AND countrylanguage.Percentage <50

# 16
SELECT city.`Name`, city.Population, country.Region
FROM city
JOIN country
ON country.`Code` = city.CountryCode
WHERE COUNT (country.Region IN (SELECT distinct country.Region FROM country)) <=3
order BY country.Region, city.Population DESC
LIMIT 60;
ПОД ОГРОМНЫМ ВОПРОСОМ!!!

# 17
провалено



# 18

провалено

# 19

# 20
SELECT country.Region, AVG(country.Population), COUNT(country.`Name`)
FROM country
WHERE country.Population > 10000000
GROUP BY country.Region
ORDER BY AVG(country.Population) DESC
LIMIT 5;

# 21
SELECT city.`Name`, COUNT(country.`Name`)
FROM country
JOIN city
ON city.ID = country.Capital
GROUP by city.`Name`
ORDER BY COUNT(country.`Name`) DESC

не пойму куда вставить WHERE COUNT(country.`Name`) > 1

# 22
SELECT country.`Name`, SUM(city.Population)
FROM country
JOIN city
ON city.CountryCode = country.`Code`
WHERE country.Population > 50000000
GROUP by country.`Name`
ORDER BY COUNT(country.`Name`) DESC
LIMIT 5;



