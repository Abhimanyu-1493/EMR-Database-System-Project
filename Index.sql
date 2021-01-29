create index provider_information_index
on provider_information (specialist_name, specialisation, availability, open_time, close_time, specialist_fees);

select specialist_name, specialisation, availability, open_time, close_time, specialist_fees from provider_information;