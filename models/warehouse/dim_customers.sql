{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT 
    "id",
    "code",
    "first_name",
    "last_name",
    "created_at",
    "first_name" || ' ' || "last_name" AS nom
FROM {{ ref('stg_customers') }}


