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
        LAG("Volume") OVER (ORDER BY "Time") AS "Prev_Volume"
    FROM hourly_data
)
SELECT 
    "Time",
    CASE WHEN "Volume" >= "Prev_Volume" OR "Prev_Volume" IS NULL THEN "Volume" ELSE NULL END AS "Growth",
    CASE WHEN "Volume" < "Prev_Volume" THEN "Volume" ELSE NULL END AS "Decline"
FROM trend_analysis
ORDER BY "Time" ASC;
