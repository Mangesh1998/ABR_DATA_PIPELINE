{{ config(materialized='table') }}

WITH abr AS (
    SELECT * FROM {{ ref('stg_abr') }}
),
common_crawl AS (
    SELECT * FROM {{ ref('stg_common_crawl') }}
),
merged AS (
    SELECT
        abr.cleaned_abn AS abn,
        COALESCE(abr.cleaned_company_name, common_crawl.cleaned_company_name) AS company_name,
        common_crawl.cleaned_industry AS industry,
        common_crawl.website_url,
        abr.address,
        abr.postcode,
        abr.state
    FROM abr
    FULL OUTER JOIN common_crawl
    ON abr.cleaned_company_name = common_crawl.cleaned_company_name
    -- For simplicity, exact match; in real scenario, use fuzzy matching
)
SELECT
    ROW_NUMBER() OVER (ORDER BY abn, company_name) AS id,
    abn,
    company_name,
    industry,
    website_url,
    address,
    postcode,
    state
FROM merged
WHERE company_name IS NOT NULL
-- Deduplication: keep first occurrence
QUALIFY ROW_NUMBER() OVER (PARTITION BY abn ORDER BY company_name) = 1