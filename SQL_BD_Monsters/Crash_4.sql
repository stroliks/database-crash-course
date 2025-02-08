

delimiter //
UPDATE Tournaments SET `winner` = (
   begin
	IF round(RAND(), 0) = 0 then
  		SELECT `player_1`;
  	ELSE
  		SELECT `player_2`;
  	END if;
)
//

delimiter ;

