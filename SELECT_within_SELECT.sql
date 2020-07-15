-- Bigger than Russia
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

-- Richer than UK
SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population  FROM world
WHERE name = 'United kingdom')
AND continent LIKE 'Europe';


-- Neighbours of Argentina and Australia
SELECT name, continent FROM world
WHERE continent IN
(SELECT continent FROM world
WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

-- Between Canada and Poland
SELECT name, population FROM world
WHERE population> (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')

-- Percentages of Germany
SELECT name, CONCAT(ROUND(100* population / (SELECT population FROM world WHERE name = 'Germany')), '%')
FROM world
WHERE continent = 'Europe'

-- Bigger than every country in Europe
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp >=0)

-- Largest in each continent
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent AND area>0)

-- First country of each continent (alphabetically)
SELECT continent, name FROM world as x
WHERE name <= ALL(SELECT name FROM world as y WHERE y.continent = x.continent)


-- Difficult Questions That Utilize Techniques Not Covered In Prior Sections
SELECT name, continent, population
FROM world as x
WHERE 25000000  > ALL
(SELECT population FROM world as y
WHERE x.continent = y.continent AND y.population > 0)

/*
Some countries have populations more than three times that of any of their neighbours
 (in the same continent). Give the countries and continents.
*/

SELECT name, continent FROM world as x
WHERE population > ALL
(SELECT population * 3 FROM world as y
  WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)
