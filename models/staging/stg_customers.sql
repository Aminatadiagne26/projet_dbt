{{ config(materialized='view') }}

SELECT
    "id",
    "code",
    "first_name",
    "last_name",
    "created_at"
FROM {{ source('raw', 'customers') }}
