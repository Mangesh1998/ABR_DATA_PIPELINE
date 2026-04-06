-- Example Queries for Australian Company Data Analysis

-- 1. Total companies by state
SELECT state, COUNT(*) AS company_count
FROM integrated_companies
GROUP BY state
ORDER BY company_count DESC;

-- 2. Top industries
SELECT industry, COUNT(*) AS count
FROM integrated_companies
WHERE industry IS NOT NULL AND industry != 'Unknown'
GROUP BY industry
ORDER BY count DESC
LIMIT 10;

-- 3. Companies with websites
SELECT COUNT(*) AS companies_with_website
FROM integrated_companies
WHERE website_url IS NOT NULL;

-- 4. Companies by postcode (top 10)
SELECT postcode, COUNT(*) AS count
FROM integrated_companies
WHERE postcode IS NOT NULL
GROUP BY postcode
ORDER BY count DESC
LIMIT 10;

-- 5. Search for specific company
SELECT * FROM integrated_companies
WHERE LOWER(company_name) LIKE '%example company%';

-- 6. Industry distribution by state
SELECT state, industry, COUNT(*) AS count
FROM integrated_companies
WHERE industry IS NOT NULL
GROUP BY state, industry
ORDER BY state, count DESC;
