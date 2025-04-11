{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT 
    b.id AS book_id,
    b.intitule,
    TO_CHAR(v.date_edit, 'Day') AS jour,
    COUNT(*) AS ventes_par_jour
FROM {{ ref('stg_books') }} b
JOIN {{ ref('stg_ventes') }} v ON b.id = v.book_id
GROUP BY book_id, intitule, jour
