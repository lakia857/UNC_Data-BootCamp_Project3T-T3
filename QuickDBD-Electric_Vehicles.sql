-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/BVF6uY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "cleaned_ev_stations" (
    "Station_Name" VARCHAR(100)   NOT NULL,
    "Street_Address" INT   NOT NULL,
    "City" VARCHAR(50)   NOT NULL,
    "State" VARCHAR(2)   NOT NULL,
    "ZIP" VARCHAR(5)   NOT NULL,
    "region" VARCHAR(50)   NOT NULL,
    "Groups_With_AccessCode" VARCHAR(75)   NOT NULL,
    "Access_Days_Time" VARCHAR(75)   NOT NULL,
    "Latitude" INT   NOT NULL,
    "Longitude" INT   NOT NULL,
    "EV_Pricing" VARCHAR(75)   NOT NULL,
    CONSTRAINT "pk_cleaned_ev_stations" PRIMARY KEY (
        "region"
     )
);

CREATE TABLE "gas_prices_df" (
    "year" INT   NOT NULL,
    "Jan" INT   NOT NULL,
    "Feb" INT   NOT NULL,
    "Mar" INT   NOT NULL,
    "Apr" INT   NOT NULL,
    "May" INT   NOT NULL,
    "Jun" INT   NOT NULL,
    "Jul" INT   NOT NULL,
    "Aug" INT   NOT NULL,
    "Sep" INT   NOT NULL,
    "Oct" INT   NOT NULL,
    "Nov" INT   NOT NULL,
    "Dec" INT   NOT NULL,
    CONSTRAINT "pk_gas_prices_df" PRIMARY KEY (
        "year"
     )
);

CREATE TABLE "ev_sales" (
    "region" VARCHAR(50)   NOT NULL,
    "powertrain" VARCHAR(5)   NOT NULL,
    "year" INT   NOT NULL,
    "value" INT   NOT NULL,
    CONSTRAINT "pk_ev_sales" PRIMARY KEY (
        "region"
     )
);

ALTER TABLE "cleaned_ev_stations" ADD CONSTRAINT "fk_cleaned_ev_stations_region" FOREIGN KEY("region")
REFERENCES "ev_sales" ("region");

ALTER TABLE "ev_sales" ADD CONSTRAINT "fk_ev_sales_year" FOREIGN KEY("year")
REFERENCES "gas_prices_df" ("year");

