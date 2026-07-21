-- Objects in Pipeline
-- Streaming table, Materialized view, and Temp View


-- Objects in Pipeline
create streaming table orders as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream (read_files('/Volumes/dev/abhijeet_ui/stream_proj/orders/',format=>"json"));

-- customers ingestion
create streaming table customer_Streaming as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream (read_files('/Volumes/dev/abhijeet_ui/stream_proj/customer/',format=>"json"));


-- payment ingestion
create streaming table payments as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream read_files('/Volumes/dev/abhijeet_ui/stream_proj/payment/',format=>"csv",
schema=> "transaction_id int, customer_id int, transaction_date timestamp, order_id int, type string" );


