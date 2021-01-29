DROP PROCEDURE IF EXISTS API_insert_billing;
 
DELIMITER //
 
CREATE PROCEDURE API_insert_billing
(
  billing_id_para int,
  patient_id_para int,
  prescription_id_para int,
  medicine_name_para varchar(100),
  medicine_quantity_para int
  )
 
BEGIN 
  DECLARE sql_error TINYINT DEFAULT FALSE;
 
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	SET sql_error = TRUE;
 
 START TRANSACTION;
 insert into billing(billing_id,patient_id,prescription_id,medicine_name,medicine_quantity)
  values(billing_id_para,patient_id_para,prescription_id_para,medicine_name_para,medicine_quantity_para);
 
	IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//
 
DELIMITER ;
 
call API_insert_billing(531,9,1027,'Nyquil',2);
SELECT * FROM billing WHERE billing_id = 531;
