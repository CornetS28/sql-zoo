### More JOIN operations

--# 1
SELECT id, title
 FROM movie
 WHERE yr=1962
--# 2
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'
--# 3
SELECT id , title , yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
   ORDER BY yr
--# 4
SELECT id
 FROM actor
   WHERE name = 'Glenn Close'
---# 5
SELECT id
 FROM movie
   WHERE title = 'Casablanca'
--# 6
SELECT name FROM casting
JOIN actor ON actorid = actor.id
WHERE movieid = (
   SELECT id
    FROM movie
      WHERE title = 'Casablanca')
--# 7
SELECT name FROM casting
JOIN actor ON actorid = actor.id
WHERE movieid = (
   SELECT id
    FROM movie
      WHERE title = 'Alien')
--# 8
SELECT title
    FROM casting
JOIN movie ON movieid = movie.id
  WHERE actorid = (
   SELECT id
    FROM actor
      WHERE name= 'Harrison Ford')
--# 9
SELECT title
    FROM casting
JOIN movie ON movieid = movie.id
  WHERE actorid = (
   SELECT id
    FROM actor
      WHERE name= 'Harrison Ford')
    AND ord != 1
--# 10
Select  title , name
  FROM movie
   JOIN casting ON movie.id = movieid
   JOIN actor ON actor.id = actorid
  WHERE ord = 1
  AND yr = 1962
--# 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)
--# 12
SELECT DISTINCT title,  (SELECT name FROM actor
                    WHERE actor.id=lead.actorid) Lead
 FROM casting
  JOIN movie ON movieid = movie.id
  JOIN casting AS lead ON casting.movieid = lead.movieid
WHERE casting.actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')
  AND lead.ord = 1
---# 13
 SELECT name FROM actor
 WHERE id IN (SELECT actorid FROM casting
                WHERE ord = 1
                GROUP BY actorid
                   HAVING COUNT(actorid) >= 30)
------# 14
SELECT title, COUNT(actorid) FROM casting
 JOIN movie ON movieid = movie.id
   WHERE yr = 1978
     GROUP BY title
      ORDER BY COUNT(actorid) DESC , title
---# 15
SELECT DISTINCT name FROM casting
 JOIN actor ON actor.id = actorid
  WHERE movieid IN (
    SELECT movieid FROM casting
      WHERE actorid = (
       SELECT id
        FROM actor
          WHERE name= 'Art Garfunkel'))
   AND name != 'Art Garfunkel'



