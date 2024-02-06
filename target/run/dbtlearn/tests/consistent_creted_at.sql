select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT  
    *
FROM
    airbnb.dev.fct_reviews AS f
    LEFT JOIN airbnb.dev.dim_listings_cleansed AS d ON f.listing_id = d.listing_id 
WHERE
    f.review_date > d.created_at
LIMIT 10
      
    ) dbt_internal_test