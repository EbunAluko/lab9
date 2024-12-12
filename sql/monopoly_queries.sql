-- @author Ebun Aluko

--EXERCISE 8.1

-- a. Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT *
FROM Game
ORDER BY time ASC;

-- b. Retrieve all the games that occurred in the past week.
SELECT *
FROM Game 
WHERE time >= NOW() - INTERVAL '7 days';

-- c. Retrieve a list of players who have (non-NULL) names.
SELECT *
FROM Player
WHERE name IS NOT NULL;

-- d. Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT playerID
FROM PlayerGame
WHERE score > 2000;

-- e. Retrieve a list of players who have Gmail accounts. 
SELECT *
FROM Player
WHERE emailAddress
LIKE '%@gmail.com%';


-- EXERCISE 8.2

-- a. Retrieve all “The King”’s game scores in decreasing order.
SELECT PlayerGame.score, Player.ID
FROM PlayerGame, Player
WHERE Player.ID = PlayerGame.playerID
AND Player.name LIKE '%The King%';

-- b. Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name
FROM Player, PlayerGame, Game
WHERE Game.time = '2006-06-28 13:20:00'
AND Player.ID = PlayerGame.playerID
AND Game.ID = PlayerGame.gameID
ORDER BY PlayerGame.score DESC LIMIT 1;

-- c.So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
The clause helps prevent unnecessary checks

-- d. The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
A situation where you would have to join a table to itself is like when you want to find consecutive transactions by the same person.
