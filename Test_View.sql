create view test_view as
select symptoms, test, test_fees
from clinical_care_information;

update test_view
set test_fees= 150
where test= 'X-Ray';

select * from clinical_care_information
where test='X-Ray';