-- Change Value format

CREATE TABLE cheese_production_new AS
SELECT
    "Year",
    "Period",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    "Domain",
    CAST("Value" AS BIGINT) AS Value
FROM cheese_production;

-- Drop the original table
DROP TABLE cheese_production;

-- Rename the new table to match the original table name
ALTER TABLE cheese_production_new RENAME TO cheese_production;

----------------------------------------------------------------

CREATE TABLE coffee_production_new AS
SELECT
    "Year",
    "Period",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    CAST("Value" AS BIGINT) AS Value
FROM coffee_production;

-- Drop the original table
DROP TABLE coffee_production;

-- Rename the new table to match the original table name
ALTER TABLE coffee_production_new RENAME TO coffee_production;

----------------------------------------------------------------

CREATE TABLE egg_production_new AS
SELECT
    "Year",
    "Period",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    "Domain",
    CAST("Value" AS BIGINT) AS Value
FROM egg_production;

-- Drop the original table
DROP TABLE egg_production;

-- Rename the new table to match the original table name
ALTER TABLE egg_production_new RENAME TO egg_production;

----------------------------------------------------------------

CREATE TABLE honey_production_new  AS
SELECT
    "Year",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    CAST("Value" AS BIGINT) AS Value
FROM honey_production;

-- Drop the original table
DROP TABLE honey_production;

-- Rename the new table to match the original table name
ALTER TABLE honey_production_new RENAME TO honey_production;

----------------------------------------------------------------

CREATE TABLE milk_production_new AS
SELECT
    "Year",
    "Period",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    "Domain",
    CAST("Value" AS BIGINT) AS Value
FROM milk_production;

-- Drop the original table
DROP TABLE milk_production;

-- Rename the new table to match the original table name
ALTER TABLE milk_production_new RENAME TO milk_production;

----------------------------------------------------------------

CREATE TABLE yogurt_production_new AS
SELECT
    "Year",
    "Period",
    "Geo_Level",
    "State_ANSI",
    "Commodity_ID",
    "Domain",
    CAST("Value" AS BIGINT) AS Value
FROM yogurt_production;

-- Drop the original table
DROP TABLE yogurt_production;

-- Rename the new table to match the original table name
ALTER TABLE yogurt_production_new RENAME TO yogurt_production;

