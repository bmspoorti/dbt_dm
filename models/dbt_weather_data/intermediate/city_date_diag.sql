

WITH city_mismatches AS (
    -- Cities in weather data but not in delay data
    SELECT DISTINCT 
        w.city AS weather_city
    FROM 
        `weather-dbdelay.weather_data.cleaned_weather_data` w
    EXCEPT DISTINCT
    SELECT DISTINCT 
        d.city AS dbdelay_city
    FROM 
        `weather-dbdelay.dbdelaydata.clean_dbdelay` d

    UNION ALL

    -- Cities in delay data but not in weather data
    SELECT DISTINCT 
        d.city AS dbdelay_city
    FROM 
        `weather-dbdelay.dbdelaydata.clean_dbdelay` d
    EXCEPT DISTINCT
    SELECT DISTINCT 
        w.city AS weather_city
    FROM 
        `weather-dbdelay.weather_data.cleaned_weather_data` w
),

date_mismatches AS (
    -- Dates in delay data but not in weather data
    SELECT DISTINCT 
        DATE(d.arrival_plan_date) AS dbdelay_date
    FROM 
        `weather-dbdelay.dbdelaydata.clean_dbdelay` d
    EXCEPT DISTINCT
    SELECT DISTINCT 
        w.date AS weather_date
    FROM 
        `weather-dbdelay.weather_data.cleaned_weather_data` w

    UNION ALL

    -- Dates in weather data but not in delay data
    SELECT DISTINCT 
        w.date AS weather_date
    FROM 
        `weather-dbdelay.weather_data.cleaned_weather_data` w
    EXCEPT DISTINCT
    SELECT DISTINCT 
        DATE(d.arrival_plan_date) AS dbdelay_date
    FROM 
        `weather-dbdelay.dbdelaydata.clean_dbdelay` d
)

SELECT * 
FROM city_mismatches
UNION ALL
SELECT * 
FROM date_mismatches;
