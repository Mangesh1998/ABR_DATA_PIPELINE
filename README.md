# Australian Company Data Pipeline

This project builds a data pipeline to collect, clean, and integrate Australian company website data from Common Crawl with business information from the Australian Business Register (ABR).

## Data Sources
- **Common Crawl**: Extract Australian company websites (target: 200,000+). Data points: Website URL, Company Name, Company Industry.
- **ABR (data.gov.au)**: Enrich with ABN and other company details.

## Technology Stack
- **Python**: Data extraction and processing.
- **Apache Spark**: Distributed processing for large datasets.
- **DBT**: Data transformation, cleaning, normalization, and testing.
- **PostgreSQL**: Database for storing integrated data.

## Project Structure
- `data/`: Raw and processed data files.
- `scripts/`: Python scripts for data extraction and initial processing.
- `dbt_project/`: DBT models and configurations.
- `sql/`: PostgreSQL schema DDL.
- `notebooks/`: Jupyter notebooks for exploration and prototyping.
- `tests/`: Additional tests.

## Setup
1. Install dependencies: `pip install -r requirements.txt`
2. Set up PostgreSQL database.
3. Configure DBT profile for PostgreSQL.
4. Run pipeline scripts in order.

## Pipeline Description
1. Extract Australian websites from Common Crawl using Spark.
2. Download and process ABR data.
3. Clean and merge datasets.
4. Use DBT for transformations and deduplication.
5. Load into PostgreSQL.

## Deliverables
- PostgreSQL schema (sql/schema.sql)
- DBT models with tests
- Example queries for analysis

## GitHub Repo
https://github.com/Mangesh1998/ABR_DATA_PIPELINE