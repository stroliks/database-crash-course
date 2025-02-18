CREATE TABLE `%Equipment` (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE `%Rentals` (
    id INT NOT NULL AUTO_INCREMENT,
    equipment_id INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    rent_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(id) ON DELETE CASCADE
);



INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Осцилограф', 5);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Микроскоп', 4);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Принтер', 3);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Стол', 2);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Уровень', 1);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Линейка', 8);
INSERT INTO `%Equipment` (`name`, quantity) VALUES ('Графы', 7);

INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (7, 'Bob', '2025-01-25');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (6, 'Smog', '2024-12-25');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (5, 'Krab', '2024-11-25');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (4, 'John', '2024-10-20');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (3, 'Bob', '2024-09-21');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (2, 'Smog', '2024-08-15');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (1, 'Bob', '2024-07-15');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (7, 'Pip', '2024-06-05');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (6, 'Smog', '2024-05-03');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (5, 'Bob', '2025-01-01');
INSERT INTO `%Rentals` (equipment_id, student_name, rent_date) VALUES (4, 'Krab', '2025-01-02');


#1 Триггер: Автоматическое уменьшение количества оборудования при аренде
DELIMITER //
CREATE TRIGGER after_rental_equipment
BEFORE INSERT ON `%Rentals`
FOR EACH ROW
BEGIN
	DECLARE equip_quan INT;
	SELECT quantity INTO equip_quan FROM `%Equipment`
	WHERE `%Equipment`.id = NEW.equipment_id;
	if equip_quan = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'оБОРУДОВАНИЯ НЕТ В НАЛИЧИИ';
	ELSE
		UPDATE `%Equipment`
		SET `%Equipment`.quantity = `%Equipment`.quantity - 1;
	END IF;
END //
DELIMITER ;
	
#2 ### **Процедура**: Возврат оборудования.- Увеличивает количество доступного оборудования. - Записывает дату возврата.

DELIMITER //
CREATE PROCEDURE ReturnEquipment (IN input_id INT)
	BEGIN
		DECLARE id_equip INT;
		SELECT `%Rentals`.equipment_id INTO id_equip FROM `%Rentals`
		WHERE `%Rentals`.id = input_id;
	
		UPDATE `%Equipment`
		SET `%Equipment`.quantity = `%Equipment`.quantity + 1
		WHERE `%Equipment`.id = id_equip;
	
		UPDATE `%Rentals`
		SET return_date = CURDATE()
		WHERE `%Rentals`.id = input_id;
	END //
DELIMITER ;


#3 ### Проверить, находится ли оборудование в аренде. - Возвращает `TRUE`, если оборудование с указанным **id** в аренде, иначе `FALSE`.

DELIMITER //
CREATE FUNCTION IsEquipmentRented(id_eq int)
RETURNS BOOL
	BEGIN
		DECLARE `count` INT;
		SELECT count(*) INTO `count` FROM `%Rentals`
		WHERE `%Rentals`.equipment_id = id_eq;
		if `count` > 0 then
			RETURN True;
		END if;
		RETURN False;
	END //
DELIMITER ;
	
## **4. Процедура**: Добавление нового оборудования в систему. Принимает название оборудования и его количество
#- Если количество < 1, выбрасывает исключение.

DELIMITER //
CREATE PROCEDURE AddEquipment(IN `input_name` VARCHAR(50), `input_quantity` INT)
BEGIN
	if `input_quantity` <0 then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'введено неверное значение количества (отрицательное)'; 
	END if;
INSERT INTO `%Equipment` (`name`,quantity) VALUES (`input_name`, `input_quantity`);
END //
DELIMITER ;


### 5 ### **Процедура**: Очистка старых записей об аренде.- Удаляет аренды, завершенные более `N` дней назад

DELIMITER //
CREATE PROCEDURE CleanOldRentals(IN `input_days`INT)
BEGIN
		delete FROM `%Rentals`
		WHERE datediff(CURDATE(), `%Rentals`.return_date) >  `input_days`;
END //
DELIMITER ;

###6 ### **Триггер**: Автоматическая установка даты возврата.- Если запись обновляется, а `return_date` остается `NULL`, 
#оно проставляется автоматически (устанавливается текущая дата).

DELIMITER //
CREATE TRIGGER Auto_state_return_data
AFTER UPDATE ON `%Rentals`
FOR EACH ROW
BEGIN 
	if NEW.return_date = NULL then
		UPDATE `%Rentals`
		SET `%Rentals`.return_date = CURDATE();
	END if;
END // 
DELIMITER ;


###7  ### **Функция**: Подсчет количества аренд у студента.- Возвращает количество записей об аренде.
DELIMITER //
CREATE FUNCTION GetStudentRentalCount(`name_rent` VARCHAR(50))
RETURNS int
BEGIN
	DECLARE count_rental INT;
	SELECT COUNT(*) INTO count_rental FROM `%Rentals`
	WHERE `%Rentals`.student_name = `name_rent`;
	RETURN count_rental;
END //
DELIMITER ;


		




	
		
 		

