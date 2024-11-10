

SELECT 
    w.city, 
    w.date
FROM 
    `weather-dbdelay.weather_data.cleaned_weather_data` w
JOIN 
    `weather-dbdelay.dbdelaydata.clean_dbdelay` d
ON 
    w.city = d.city
AND 
    w.date = DATE(d.arrival_plan_date);
