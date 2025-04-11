{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT * FROM {{ ref('stg_category') }}
