--# SELECT names

--#1. Show the countries that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%';

--#2. Show the countries that end with y
SELECT name FROM world
  WHERE name LIKE '%y';

--#3. Show the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%x%';

--#4. Show the countries that end with "land"
SELECT name FROM world
  WHERE name LIKE '%land';

--#5. Show the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia';

--#6. Show the countries that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%oo%';

--#7. Show the countries thathave three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

--#8. Show the countries that have "t" as the second character
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

--#9. Show the countries that have two "o" characters separated by two others
SELECT name FROM world
 WHERE name LIKE '%o__o%';

--#10. Show the countries that have exactly four characters
SELECT name FROM world
 WHERE name LIKE '____';

--#11. Show the countries where the name is the capital city.
 SELECT name
  FROM world
 WHERE name = capital;

--#12. Show the countries where the capital is the country plus "City"
 SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

--#13. Show the countries where the capital includes the name of the country
SELECT capital, name
  FROM world
  WHERE capital LIKE concat('%', name, '%')

--#14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
    FROM world
    WHERE name != capital AND capital LIKE concat('%', name, '%');

--# 15 Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') AS extension
    FROM world
    WHERE capital LIKE concat(name, '%') AND capital != name;