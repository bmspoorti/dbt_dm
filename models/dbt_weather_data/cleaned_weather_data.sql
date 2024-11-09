CREATE OR REPLACE VIEW `weather-dbdelay`.`weather_data`.`cleaned_weather_data` AS
WITH base_data AS (
    SELECT
        *,
        DATE(CURRENT_DATE()) AS date, -- Replace with actual date column if available
        TIME(PARSE_TIME('%H:%M:%S', time)) AS clean_time, -- Adjust format based on actual data
        REGEXP_EXTRACT(condition, "'text': '(.*?)'") AS clean_condition
    FROM `weather-dbdelay.weather_data.germany_weather`
),
 
cleaned_data AS (
    SELECT
        date,
        clean_time AS time,
        temp_c,
        temp_f,
        is_day,
        clean_condition AS condition,
        wind_mph,
        wind_kph,
        wind_degree,
        wind_dir,
        pressure_mb,
        pressure_in,
        precip_mm,
        precip_in,
        snow_cm,
        humidity,
        cloud,
        feelslike_c,
        feelslike_f,
        windchill_c,
        windchill_f,
        heatindex_c,
        heatindex_f,
        dewpoint_c,
        dewpoint_f,
        will_it_rain,
        chance_of_rain,
        will_it_snow,
        chance_of_snow,
        vis_km,
        vis_miles,
        gust_mph,
        gust_kph,
        uv,
        city
    FROM base_data
)
SELECT * FROM cleaned_data