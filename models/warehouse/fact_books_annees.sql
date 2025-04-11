{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT 
    b.id AS book_id,
    b.intitule,
    EXTRACT(YEAR FROM v.date_edit) AS annee,
    COUNT(*) AS ventes_par_annee
FROM {{ ref('stg_ventes') }} v
JOIN {{ ref('stg_books') }} b ON v.book_id = b.id
GROUP BY b.id, b.intitule, annee
