-- 1962 movies
SELECT id, title FROM movie
WHERE yr=1962

-- When was Citizen Kane released?
SELECT yr FROM movie
WHERE title='Citizen Kane'

-- Star Trek movies
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr ASC

-- id for actor Glenn Close
SELECT id FROM actor
WHERE name='Glenn Close'

-- id for Casablanca
SELECT id FROM movie
WHERE title = 'Casablanca'

-- Cast list for Casablanca
SELECT name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid = 27;

-- Alien cast list
SELECT name FROM actor
JOIN casting ON (actor.id=casting.actorid)
JOIN movie  ON (movie.id=casting.movieid)
WHERE title = 'Alien'

-- Harrison Ford movies
SELECT title FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Harrison Ford'

-- Harrison Ford as a supporting actor
SELECT title FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Harrison Ford' AND ord !=1


-- Lead actors in 1962 movies
SELECT title, name FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE  ord =1 AND yr = 1962

-- Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

-- Lead actor in Julie Andrews movies
SELECT title,name FROM movie
JOIN casting ON (movieid=movie.id AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='JULIE ANDREWS'))

-- Actors with 15 leading roles
SELECT name FROM casting
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING sum(ord) >= 15
ORDER BY name

/*
List the films released in the year 1978 ordered by the number of actors in the
 cast, then by title.
*/
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON  id=movieid
JOIN actor ON actor.id=casting.actorid
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

-- List all the people who have worked with 'Art Garfunkel'.
SELECT name FROM movie
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE movie.title IN (SELECT title FROM movie 
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE name = 'Art Garfunkel')
AND
actor.name !='Art Garfunkel'
