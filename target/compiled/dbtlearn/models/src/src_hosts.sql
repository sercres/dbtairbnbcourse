WITH raw_hosts AS (
    SELECT * FROM airbnb.raw.raw_hosts
)

SELECT
    ID as host_id,
    NAME AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM 
    raw_hosts