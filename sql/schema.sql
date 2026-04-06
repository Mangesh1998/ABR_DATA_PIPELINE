-- PostgreSQL Schema for Australian Company Data Pipeline

-- Create database (run manually if needed)
-- CREATE DATABASE australian_companies;

-- Use the database
-- \c australian_companies;

-- Integrated companies table
CREATE TABLE integrated_companies (
    id SERIAL PRIMARY KEY,
    abn VARCHAR(11) UNIQUE,  -- Australian Business Number
    company_name VARCHAR(255) NOT NULL,
    industry VARCHAR(255),
    website_url VARCHAR(500),
    address TEXT,
    postcode VARCHAR(10),
    state VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_abn ON integrated_companies (abn);
CREATE INDEX idx_company_name ON integrated_companies (company_name);
CREATE INDEX idx_industry ON integrated_companies (industry);
CREATE INDEX idx_state ON integrated_companies (state);

-- Reader role (grant select permissions)
-- CREATE ROLE reader;
-- GRANT SELECT ON integrated_companies TO reader;

-- Comments
COMMENT ON TABLE integrated_companies IS 'Integrated Australian company data from Common Crawl and ABR';
COMMENT ON COLUMN integrated_companies.abn IS 'Australian Business Number from ABR';
COMMENT ON COLUMN integrated_companies.website_url IS 'Company website URL from Common Crawl';
