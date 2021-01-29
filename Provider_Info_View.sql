create view provider_info_view as
select specialist_name, availability, open_time, close_time, specialist_fees
from provider_information;

select * from provider_info_view;