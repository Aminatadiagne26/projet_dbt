{{ config(materialized='view') }}

SELECT
    "id",
    "intitule",
    "created_at"
FROM {{ source('raw', 'category') }}
