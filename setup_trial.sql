-- Create objects for the HOL. Database and stages to push files.
CREATE DATABASE IF NOT EXISTS EREDIVISIE_PREDICTION;
CREATE OR REPLACE WAREHOUSE EREDIVISIE_PREDICTION_WH
  WAREHOUSE_SIZE = 'X-Small'
  AUTO_SUSPEND = 60;
  
CREATE WAREHOUSE IF NOT EXISTS EREDIVISIE_PREDICTION
    WAREHOUSE_SIZE = 'xsmall' 
    AUTO_SUSPEND=60 
    AUTO_RESUME=True;

CREATE STAGE IF NOT EXISTS EREDIVISIE_PREDICTION.PUBLIC.RAW_DATA;

-- After creating these objects, upload dataset into the stage RAW_DATA. 
-- If you are not familiar with pushing files into stage, check the readme.md in the GitHub repo to do it directly using Snowsight UI or via command line. Following files must be uploaded to RAW_DATA stage:
---- eredivisie_fixture.csv
---- eredivisie_history.csv
-- Once uploaded, you can execute the following commands:

USE ROLE ACCOUNTADMIN;
USE DATABASE EREDIVISIE_PREDICTION;
USE SCHEMA PUBLIC;

CREATE OR REPLACE FILE FORMAT ff_generic_csv
    TYPE = CSV
    FIELD_DELIMITER = ','
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    PARSE_HEADER = True
    TRIM_SPACE = TRUE
    NULL_IF = ('NULL', 'null')
    ESCAPE_UNENCLOSED_FIELD= NONE
    ERROR_ON_COLUMN_COUNT_MISMATCH=false
    replace_invalid_characters=true
    date_format=auto
    time_format=auto
    timestamp_format=auto;


CREATE OR REPLACE TABLE EREDIVISIE_HISTORY
    USING TEMPLATE (
        SELECT ARRAY_AGG(object_construct(*))
        FROM TABLE(
            INFER_SCHEMA(
                LOCATION=>'@raw_data/eredivisie_history.csv',
                FILE_FORMAT=>'ff_generic_csv',
                IGNORE_CASE => TRUE
            )
        )
    );

COPY INTO EREDIVISIE_HISTORY
FROM '@raw_data/eredivisie_history.csv'
FILE_FORMAT = ff_generic_csv
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

CREATE OR REPLACE TABLE EREDIVISIE_FIXTURE
    USING TEMPLATE (
        SELECT ARRAY_AGG(object_construct(*))
        FROM TABLE(
            INFER_SCHEMA(
                LOCATION=>'@raw_data/eredivisie_fixture.csv',
                FILE_FORMAT=>'ff_generic_csv',
                IGNORE_CASE => TRUE
            )
        )
    );

COPY INTO EREDIVISIE_FIXTURE
FROM '@raw_data/eredivisie_fixture.csv'
FILE_FORMAT = ff_generic_csv
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;
