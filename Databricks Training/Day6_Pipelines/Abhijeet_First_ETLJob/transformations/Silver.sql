create streaming table dev.abhijeet_silver.order_cleaned
( CONSTRAINT valid_customer_id EXPECT (customer_id IS NOT NULL) ON VIOLATION DROP ROW)
as
select * except (_rescued_data, file_name, file_path, ingestion_date) from stream(dev.abhijeet_bronze.orders);


create streaming table dev.abhijeet_silver.customers_cleaned
( CONSTRAINT valid_customer_email EXPECT (email IS NOT NULL),
CONSTRAINT valid_customer_email_format EXPECT (email RLIKE '^[a-zA-Z0-9._%+\\-]+@[a-zA-Z0-9.\\-]+\\.[a-zA-Z]{2,}'))
as
select * except (_rescued_data, file_name, file_path, ingestion_date) from stream(dev.abhijeet_bronze.customer);