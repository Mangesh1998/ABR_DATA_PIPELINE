#!/usr/bin/env python3
"""
Load processed data to PostgreSQL raw schema.
"""

import pandas as pd
import psycopg2
from sqlalchemy import create_engine

def load_to_postgres():
    # Load data
    common_crawl_df = pd.read_parquet('data/common_crawl_raw.parquet')
    abr_df = pd.read_parquet('data/abr_processed.parquet')

    # Connect to Postgres
    engine = create_engine('postgresql://user:password@localhost/australian_companies')

    # Create raw schema if not exists
    with engine.connect() as conn:
        conn.execute("CREATE SCHEMA IF NOT EXISTS raw;")

    # Load tables
    common_crawl_df.to_sql('common_crawl', engine, schema='raw', if_exists='replace', index=False)
    abr_df.to_sql('abr', engine, schema='raw', if_exists='replace', index=False)

if __name__ == '__main__':
    load_to_postgres()