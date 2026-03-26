/* USDC Whale Tracker - Ethereum Mainnet */
SELECT 
    tr."from" AS "Sender",
    tr."to" AS "Receiver",
    tr.value / 1e6 AS "Amount_USDC",
    tr.evt_block_time AS "Time"
FROM erc20_ethereum.evt_Transfer tr
WHERE tr.contract_address = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
AND tr.value / 1e6 >= 1000000
AND tr.evt_block_time > now() - interval '1' day
ORDER BY tr.value DESC;
