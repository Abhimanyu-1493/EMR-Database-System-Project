GRANT SELECT ON emr_db5.provider_information TO 'specialist_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON emr_db5.clinical_care_information TO 'specialist_user'@'localhost';


GRANT SELECT ON emr_db5.provider_information TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON emr_db5.billing TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON emr_db5.visit_information TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON emr_db5.patient_information TO 'receptionist_user'@'localhost';


GRANT SELECT, INSERT, UPDATE, DELETE ON emr_db5.medicine TO 'supplier_user'@'localhost';


GRANT SELECT ON emr_db5.patient_information TO 'patient_user'@'localhost';