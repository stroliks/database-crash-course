
UPDATE ___Monsters
SET count_wins = count_wins + 1
WHERE ___Monsters.id = ___Tournaments.winner;


ALTER TABLE ___Tournaments
ADD COLUMN `Arena` INTEGER UNSIGNED;


CREATE TABLE `___Arena` (
	`id` INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` ENUM(`Kolizey`, `Sandbox`) NOT NULL

	CONSTRAINT `fk_arena_tournament` 
	FOREIGN KEY (`id`) 
	REFERENCES `___Tournaments` (`Arena`)
) 