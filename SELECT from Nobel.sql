-- Winners from 1950
SELECT * FROM nobel
WHERE yr = 1950;

-- 1962 Literature
SELECT winner FROM nobel
WHERE yr = 1962
AND subject = 'Literature';

-- Albert Einstein
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein';

-- Recent Peace Prizes
SELECT winner FROM nobel
WHERE yr >= 2000 AND subject = 'Peace';

-- Literature in the 1980's
SELECT * FROM nobel
WHERE  subject = 'Literature'
AND yr >= 1980 AND yr <= 1989;

-- Only Presidents
SELECT * FROM nobel
WHERE  winner = 'Theodore Roosevelt'
OR winner = 'Woodrow Wilson'
OR winner = 'Jimmy Carter'
OR winner = 'Barack Obama';

-- John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- Chemistry and Physics from different years
SELECT * FROM nobel
WHERE
(yr = 1980 AND subject = 'Physics')
OR
(yr = 1984 AND subject = 'Chemistry')

-- Early Medicine, Late Literature
SELECT * FROM nobel
WHERE
(yr < 1910 AND subject LIKE 'medicine')
OR
(subject LIKE 'literature' AND yr >= 2004);

-- Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
WHERE winner LIKE 'PETER GR_NBERG'

-- Apostrophe
SELECT * FROM nobel
WHERE winner LIKE 'EUGENE O_NEILL'

-- Knights of the realm
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner

-- Chemistry and Physics last
SELECT winner, subject  FROM nobel
WHERE yr=1984
ORDER BY subject IN ('physics', 'chemistry'), subject,winner
