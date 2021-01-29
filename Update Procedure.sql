DROP PROCEDURE IF EXISTS API_update_provider_information;
 
DELIMITER //

CREATE PROCEDURE API_update_provider_information
(
  Specialist_id_parameter     varchar(50),
  Contact_number_parameter    VARCHAR(100)
)

BEGIN 
  DECLARE sql_error TINYINT DEFAULT FALSE;
 
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
 
 START TRANSACTION;
 
 Update provider_information
 set contact_number = contact_number_parameter
 where specialist_id = specialist_id_parameter;
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//

DELIMITER ;
 
call API_update_provider_information ('A103','(888) 547-7755');
select * from provider_information where specialist_id='A103';