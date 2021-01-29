DROP PROCEDURE IF EXISTS API_delete_medicine;
 
DELIMITER //
CREATE PROCEDURE API_delete_medicine
(
  medicine_name_para	varchar(100)
 
)

BEGIN 
  DECLARE sql_error TINYINT DEFAULT FALSE;
 
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	SET sql_error = TRUE;
 
 START TRANSACTION;
 
delete from medicine where medicine_name = medicine_name_para;
	IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//
 
DELIMITER ;
 
call API_delete_medicine('Paracetamol 500');
select * from medicine where medicine_name = 'Paracetamol 500';