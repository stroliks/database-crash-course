
CREATE TABLE IF NOT EXISTS `Monsters` (
`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`type` ENUM ("Smaug", "Azazel","Grum","Krak") NOT NULL,
`power` INTEGER NOT NULL,
`coach` VARCHAR(100) NOT NULL,
`count_wins` INTEGER
 );

CREATE TABLE IF NOT EXISTS `Couches` (
`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`style` ENUM ("Lite", "Middle", "Hard") NOT NULL,
`raiting` INTEGER NOT NULL,
`experience` INTEGER NOT NULL,
`id_monster` INTEGER UNSIGNED NOT NULL,
 CONSTRAINT fk_couch_monster
 FOREIGN KEY (`id_monster`)
 REFERENCES `Monsters`(`id`)
 );
 
CREATE TABLE IF NOT EXISTS `Tournaments` (
`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`prize` INTEGER NOT NULL,
`player_1` INTEGER NOT NULL,
`player_2` INTEGER NOT NULL,
`winner` VARCHAR(100) NOT NULL,
`date` TIMESTAMP NOT NULL,
 CONSTRAINT fk_tournament_monsters
 FOREIGN KEY (`player_1`, `player_2`)
 REFERENCES `Monsters`(`id`, `id`)
 );