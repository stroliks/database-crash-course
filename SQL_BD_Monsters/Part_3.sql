SELECT ___Monsters.`name` AS name_monstr, ___Monsters.count_wins AS count_wins, ___Couches.`name` AS monstr_couch
FROM `___Monsters`
INNER JOIN `___Couches`
ON ___Couches.id_monster = ___Monsters.id;


SELECT ___Tournaments.id AS id_tournament, ___Monsters.`name` AS winner
FROM ___Tournaments
INNER JOIN ___Monsters
ON ___Monsters.id = ___Tournaments.winner;


SELECT ___Tournaments.id AS id_tournament, ___Tournaments.Arena AS arena, ___Tournaments.date,
(SELECT if (___Tournaments.date >= '2025-02-09', 'in future', 'Completed')) AS status_tournament
FROM ___Tournaments;

SELECT AVG(`prize`)
FROM ___Tournaments;

SELECT `name`, `count_wins`
FROM ___Monsters
WHERE `count_wins` > (SELECT AVG(`count_wins`) FROM ___Monsters);

# запрос 6 не корректен так как по условию у каждого монстра 1 тренер и наоборот

SELECT `Arena`, SUM( `prize`)
FROM ___Tournaments
GROUP BY `Arena`;

SELECT Arena, COUNT(*)
FROM ___Tournaments
GROUP BY Arena;

# запрос 9 не корректен так как по условию у каждого монстра 1 тренер и наоборот - то есть среднее количество побед монстров
#у каждого тренера будет равно количеству побед монстра

SELECT DISTINCT `name`
FROM ___Couches
INNER JOIN ___Tournaments
ON ___Couches.id_monster = ___Tournaments.winner;

SELECT ___Couches.`name` AS couch_name, `winner`, ___Monsters.`name` AS monster_name, COUNT(*)
FROM ___Tournaments
INNER JOIN ___Couches
ON ___Tournaments.winner = ___Couches.id_monster
INNER JOIN ___Monsters
ON ___Monsters.id = ___Tournaments.winner
GROUP BY `winner`
having COUNT(*) >= 2;

