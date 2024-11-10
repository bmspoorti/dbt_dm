WITH weather AS (
    SELECT
        date,
        city,
        clean_condition,
        precip_mm,
        wind_mph,
        gust_mph
    FROM `weather-dbdelay.weather_data.cleaned_weather_data`
),

delays AS (
    SELECT
        arrival_plan_date AS date,
        city,
        arrival_delay_m,
        departure_delay_m,
        arrival_status,
        departure_status
    FROM `weather-dbdelay.dbdelaydata.clean_dbdelay`
)

SELECT
    w.date,
    w.city,
    w.clean_condition,
    w.precip_mm,
    w.wind_mph,
    w.gust_mph,
    d.arrival_delay_m,
    d.departure_delay_m,
    d.arrival_status,
    d.departure_status,
    CASE 
        WHEN clean_condition LIKE '%Rain%' OR clean_condition LIKE '%Snow%' OR precip_mm > 0 THEN 'Bad Weather'
        ELSE 'Good Weather'
    END AS weather_status
FROM weather w
JOIN delays d
ON w.city = d.city AND w.date = d.date
ORDER BY w.date, w.city;
