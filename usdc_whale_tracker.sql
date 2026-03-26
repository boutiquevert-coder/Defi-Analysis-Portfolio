WITH hourly_data AS (
    SELECT 
        date_trunc('hour', tr.evt_block_time) AS "Time",
        SUM(tr.value / 1e6) AS "Volume"
    FROM erc20_ethereum.evt_Transfer tr
    WHERE tr.contract_address = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
    AND tr.value / 1e6 >= 1000000
    AND tr.evt_block_time > now() - interval '1' day
    GROUP BY 1
),
trend_analysis AS (
    SELECT 
        "Time",
        "Volume",
        LAG("Volume") OVER (ORDER BY "Time") AS "Prev_Volume",
        AVG("Volume") OVER (ORDER BY "Time" ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS "Trend_Line_M"
    FROM hourly_data
)
SELECT 
    "Time",
    CASE WHEN "Volume" >= "Prev_Volume" OR "Prev_Volume" IS NULL THEN "Volume" / 1e6 ELSE NULL END AS "Inflow_M",
    CASE WHEN "Volume" < "Prev_Volume" THEN "Volume" / 1e6 ELSE NULL END AS "Outflow_M",
    "Trend_Line_M" / 1e6 AS "Moving_Average_M"
FROM trend_analysis
ORDER BY "Time" ASC;
