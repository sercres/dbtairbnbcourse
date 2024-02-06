
  create or replace  view airbnb.dev.src_hosts
  
   as (
    WITH raw_hosts AS (
    SELECT * FROM AIRBNB.RAW.RAW_HOSTS
)

SELECT
    ID as host_id,
    NAME AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM 
    raw_hosts
  );
