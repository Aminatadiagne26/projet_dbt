{{ config(materialized='view', schema='WAREHOUSE') }}

SELECT 
    b.id AS book_id,
    b.titre,
    TO_CHAR(v.date_edit, 'Month') AS mois,
    COUNT(*) AS ventes_par_mois
FROM {{ ref('stg_books') }} b
JOIN {{ ref('stg_ventes') }} v ON b.id = v.book_id
GROUP BY book_id, titre, mois
