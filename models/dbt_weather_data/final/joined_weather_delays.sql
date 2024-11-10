SELECT 
    w.date,
    w.city,
    w.temp_c,
    w.clean_condition,
    d.arrival_delay_m,
    d.departure_delay_m
FROM 
    `weather-dbdelay.weather_data.cleaned_weather_data` w
JOIN 
    `weather-dbdelay.dbdelaydata.clean_dbdelay` d
ON 
    w.city = d.city
AND 
    w.date = DATE(d.arrival_plan_date);
