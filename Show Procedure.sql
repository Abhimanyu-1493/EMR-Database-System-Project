Drop procedure if exists API_patient_information;

DELIMITER //
CREATE PROCEDURE API_patient_information 
(
  patient_id_para int
) 
BEGIN
		SELECT patient_id, concat(patient_first_name, ' ' , patient_last_name) as FullName, patient_phone, patient_address
        FROM patient_information 
        WHERE patient_id = patient_id_para;
END //
        
        
	call API_patient_information(2);