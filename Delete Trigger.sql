DROP TRIGGER IF EXISTS medicine_after_delete;

DELIMITER //
CREATE TRIGGER medicine_after_delete
AFTER DELETE ON medicine
FOR EACH ROW
BEGIN
INSERT INTO medicine_audit VALUES
    (OLD.medicine_name, OLD.medicine_price_USD, OLD.supplier_id, 'DELETED', session_user(), NOW());
END; //
DELIMITER ;

delete from medicine
where medicine_name='Crocin';

select * from medicine where medicine_name='Crocin';

select * from medicine_audit;