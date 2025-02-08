
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
`player_1` INTEGER UNSIGNED NOT NULL,
`player_2` INTEGER UNSIGNED NOT NULL,
`winner` VARCHAR(100) NOT NULL,
`date` TIMESTAMP NOT NULL,
 CONSTRAINT fk_tournament_monster1
 FOREIGN KEY (`player_1`)
 REFERENCES `Monsters`(`id`),
CONSTRAINT fk_tournament_monster2
 FOREIGN KEY (`player_2`)
 REFERENCES `Monsters`(`id`)
 );
 
 
 
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Hollis', 'Smaug', '65', '1', '3');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Arturo', 'Grum', '88', '2', '2');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Warren', 'Grum', '89', '3', '4');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Lionel', 'Smaug', '58', '4', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Demarco', 'Smaug', '58', '5', '2');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Mara', 'Krak', '72', '6', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Lauren', 'Azazel', '64', '7', '0');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Sarina', 'Krak', '51', '8', '5');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Velma', 'Smaug', '84', '9', '6');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Jewell', 'Krak', '93', '10', '7');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Jeffry', 'Azazel', '85', '11', '3');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Brooklyn', 'Krak', '62', '12', '3');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Nico', 'Grum', '86', '13', '2');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Jason', 'Smaug', '59', '14', '6');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Matt', 'Grum', '58', '15', '6');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Mina', 'Smaug', '63', '16', '0');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Cristopher', 'Azazel', '90', '17', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Tyler', 'Azazel', '82', '18', '2');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Guiseppe', 'Smaug', '52', '19', '1');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Marjory', 'Smaug', '64', '20', '1');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Manuel', 'Smaug', '51', '21', '3');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Milford', 'Krak', '91', '22', '6');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Marquis', 'Grum', '87', '23', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Aimee', 'Grum', '75', '24', '5');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Sabryna', 'Krak', '78', '25', '1');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Finn', 'Azazel', '59', '26', '2');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Milan', 'Krak', '57', '27', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Joanie', 'Azazel', '99', '28', '0');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('Elliott', 'Azazel', '59', '29', '8');
INSERT INTO Monsters (`name`, `type`, `power`, `coach`, `count_wins`) VALUES ('John', 'Smaug', '80', '30', '4');



INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Rae', 'Lite', '50', '98', '1');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Landen', 'Hard', '53', '55', '2');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Josephine', 'Lite', '51', '11', '3');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Zora', 'Lite', '91', '54', '4');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Claudie', 'Lite', '93', '72', '5');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Elisabeth', 'Lite', '88', '69', '6');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Xavier', 'Middle', '43', '19', '7');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Kailey', 'Lite', '29', '36', '8');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Ethelyn', 'Lite', '16', '60', '9');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Buddy', 'Hard', '73', '4', '10');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Everett', 'Hard', '76', '37', '11');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Haylie', 'Lite', '63', '49', '12');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Bettie', 'Middle', '68', '16', '13');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Queenie', 'Hard', '75', '92', '14');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Emmie', 'Middle', '4', '43', '15');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Rita', 'Hard', '2', '54', '16');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Amalia', 'Lite', '96', '38', '17');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Camden', 'Hard', '13', '76', '18');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Kira', 'Hard', '13', '27', '19');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Adonis', 'Middle', '23', '94', '20');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Wilfrid', 'Middle', '33', '57', '21');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Anabel', 'Middle', '46', '51', '22');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Millie', 'Lite', '27', '6', '23');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Madeline', 'Lite', '39', '93', '24');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Marlon', 'Lite', '94', '73', '25');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Leif', 'Hard', '67', '1', '26');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Summer', 'Hard', '82', '84', '27');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Jakob', 'Hard', '76', '98', '28');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Otho', 'Hard', '94', '9', '29');
INSERT INTO Couches (`name`, `style`, `raiting`, `experience`, `id_monster`) VALUES ('Mackenzie', 'Lite', '51', '96', '30');





INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('411000', '8', '10', '2009-02-05T15:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('51000', '3', '10', '2010-01-18T20:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('155000', '16', '28', '2011-01-01T02:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('163000', '24', '2', '2011-12-14T08:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('330000', '3', '30', '2012-11-25T13:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('120000', '18', '26', '2013-11-07T19:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('207000', '6', '28', '2014-10-21T00:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('252000', '9', '28', '2015-10-03T04:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('184000', '16', '18', '2016-09-14T10:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('474000', '7', '21', '2017-08-27T15:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('140000', '14', '1', '2018-08-09T20:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('81000', '6', '5', '2019-07-23T02:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('128000', '27', '25', '2020-07-04T07:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('454000', '12', '20', '2021-06-16T12:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('169000', '15', '23', '2022-05-29T18:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('482000', '17', '30', '2023-05-11T23:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('452000', '29', '23', '2024-04-23T04:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('230000', '19', '14', '2025-04-05T10:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('50000', '11', '7', '2026-03-18T15:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('179000', '29', '1', '2027-02-28T20:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('193000', '13', '15', '2028-02-11T02:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('481000', '4', '26', '2029-01-23T07:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('215000', '10', '27', '2030-01-05T12:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('487000', '3', '19', '2030-12-18T18:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('484000', '8', '23', '2031-11-30T23:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('27000', '12', '16', '2032-11-12T04:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('306000', '23', '22', '2033-10-25T10:06:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('322000', '27', '3', '2034-10-07T15:26:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('109000', '7', '15', '2035-09-19T20:46:14.879');
INSERT INTO Tournaments (`prize`, `player_1`, `player_2`, `date`) VALUES ('491000', '17', '8', '2036-09-01T02:06:14.879');


UPDATE ___Tournaments
SET winner = player_1 
WHERE ROUND(RAND(), 0) = 0;

UPDATE ___Tournaments
SET winner = player_2 
WHERE winner = '';