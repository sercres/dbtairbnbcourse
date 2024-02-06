

WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT * FROM airbnb.raw.raw_reviews
)

SELECT
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
FROM
    raw_reviews
),src_reviews AS (
    SELECT * FROM __dbt__cte__src_reviews
)
SELECT
    
    
md5(cast(coalesce(cast(listing_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_date as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(reviewer_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_text as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) As review_id,
 * 
FROM src_reviews
WHERE review_text IS NOT NULL
 
    AND review_date > (select MAX(review_date) from airbnb.dev.fct_reviews)
