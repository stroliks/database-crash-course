RENAME TABLE  Monsters TO ___Monsters;
RENAME TABLE  Tournaments TO ___Tournaments;
RENAME TABLE  Couches TO ___Couches;


UPDATE ___Monsters
INNER JOIN ___Tournaments
ON ___Tournaments.winner = ___Monsters.id
SET count_wins = count_wins + 1
WHERE ___Monsters.id = ___Tournaments.winner;


ALTER TABLE ___Tournaments
ADD COLUMN `Arena` VARCHAR(50);


CREATE TABLE `___Arena` (
	`id` INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` ENUM('Kolizey', 'Sandbox') NOT NULL);
	
INSERT INTO `___Arena` (`id`, `name`) VALUES ('1', 'Kolizey');	
INSERT INTO `___Arena` (`id`, `name`) VALUES ('2', 'Sandbox');	


UPDATE `___Tournaments` t
SET t.Arena = 'Kolizey'
WHERE t.prize < (SELECT * FROM (SELECT AVG(prize) FROM `___Tournaments`) AS t1);

UPDATE `___Tournaments` t
SET t.Arena = 'Sandbox'
WHERE t.prize >= (SELECT * FROM (SELECT AVG(prize) FROM `___Tournaments`) AS t1);

ALTER TABLE ___Tournaments
ADD COLUMN `id_arena` INTEGER UNSIGNED;

ALTER TABLE `___Tournaments`
ADD CONSTRAINT fk_arena_idtournament
FOREIGN KEY(`id_arena`)
REFERENCES  `___Arena`(`id`);

CREATE INDEX name_index
ON ___Monsters(`name`);
