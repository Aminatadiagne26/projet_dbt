{{ config(materialized='view', schema='MARTS') }}

SELECT 
    fv.id AS vente_id,
    fv.annees,
    fv.mois,
    fv.jour,
    fv.pu,
    fv.qte,

    ff.id AS facture_id,
    ff.code AS facture_code,
    ff.qte_totale,
    ff.total_amount,
    ff.total_paid,

    dc.intitule AS category_intitule,

    db.code AS book_code,
    db.intitule AS book_intitule,
    db.isbn_10,
    db.isbn_13,

    dcu.code AS customer_code,
    dcu.nom AS customer_nom

FROM {{ ref('fact_ventes') }} fv
LEFT JOIN {{ ref('fact_factures') }} ff ON fv.facture_id = ff.id
LEFT JOIN {{ ref('dim_books') }} db ON fv.book_id = db.book_id
LEFT JOIN {{ ref('dim_category') }} dc ON db.category_id = dc.category_id
LEFT JOIN {{ ref('dim_customers') }} dcu ON fv.customer_id = dcu.customer_id
