DROP TRIGGER IF EXISTS patient_information_after_update;

DELIMITER //
CREATE TRIGGER patient_information_after_update
AFTER UPDATE ON patient_information
FOR EACH ROW
BEGIN
    INSERT INTO patient_information_audit VALUES
    (OLD.patient_id, OLD.patient_first_name, OLD.patient_last_name, OLD.patient_address,
    OLD.patient_zip_code, OLD.patient_phone, 'UPDATED', session_user(), NOW());
END//
DELIMITER ;

UPDATE patient_information
SET patient_phone = '(256) 654-6542'
WHERE patient_id = 11;

select * from patient_information where patient_id=11;
select * from patient_information_audit;