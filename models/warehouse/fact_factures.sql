{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT 
    *,
    EXTRACT(year FROM date_edit) AS annee,
    TO_CHAR(date_edit, 'Month') AS mois,
    TO_CHAR(date_edit, 'Day') AS jour
FROM {{ ref('stg_factures') }}
