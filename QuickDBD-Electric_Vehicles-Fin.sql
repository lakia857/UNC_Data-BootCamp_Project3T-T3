-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/BVF6uY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "cleaned_ev_stations" (
    "Station_Name" VARCHAR(250),
    "Street_Address" VARCHAR(250),
    "City" VARCHAR(50),
    "State" VARCHAR(2),
    "ZIP" VARCHAR(10),
    "region" VARCHAR(50),
    "Groups_With_AccessCode" VARCHAR(250),
    "Access_Days_Time" VARCHAR(500),
    "Latitude" FLOAT,
    "Longitude" FLOAT,
    "EV_Pricing" VARCHAR(500),
    CONSTRAINT "pk_cleaned_ev_stations" PRIMARY KEY (
        "region"
     )
);

CREATE TABLE "gas_prices_df" (
    "year" INT,
    "Jan" Decimal,
    "Feb" Decimal,
    "Mar" Decimal,
    "Apr" Decimal,
    "May" Decimal,
    "Jun" Decimal,
    "Jul" Decimal,
    "Aug" Decimal,
    "Sep" Decimal,
    "Oct" Decimal,
    "Nov" Decimal,
    "Dec" Decimal,
    CONSTRAINT "pk_gas_prices_df" PRIMARY KEY (
        "year"
     )
);

CREATE TABLE "ev_sales" (
    "region" VARCHAR(50),
    "powertrain" VARCHAR(5),
    "year" INT,
    "value" Decimal,
    CONSTRAINT "pk_ev_sales" PRIMARY KEY (
        "region"
     )
);

ALTER TABLE "cleaned_ev_stations" ADD CONSTRAINT "fk_cleaned_ev_stations_region" FOREIGN KEY("region")
REFERENCES "ev_sales" ("region");

ALTER TABLE "ev_sales" ADD CONSTRAINT "fk_ev_sales_year" FOREIGN KEY("year")
REFERENCES "gas_prices_df" ("year");

ALTER TABLE cleaned_ev_stations DROP CONSTRAINT pk_cleaned_ev_stations;

ALTER TABLE ev_sales DROP CONSTRAINT pk_ev_sales;

SELECT * FROM cleaned_ev_stations