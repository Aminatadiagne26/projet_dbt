{{ config(materialized='view') }}

SELECT
    "id",
    "code",
    TO_DATE("date_edit", 'YYYY-MM-DD') AS date_edit,
    "customers_id",
    "qte_totale",
    "total_amount",
    "total_paid",
    "created_at"
FROM {{ source('raw', 'factures') }}

