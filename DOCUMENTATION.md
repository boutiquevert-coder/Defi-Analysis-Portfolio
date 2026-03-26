<div align="center">
  <h1>📖 Technical Documentation</h1>
  <h3>Institutional USDC Whale Tracker</h3>
  <p><i>Deep-dive into blockchain data analysis and visualization methodology.</i></p>

  <hr />

  <a href="https://dune.com/gavrilili/institutional-usdc-whale-analysis">
    <img src="https://img.shields.io/badge/View_Live_Dashboard-Dune_Analytics-blue?style=for-the-badge&logo=dune" />
  </a>
</div>

<br />

## 🛠️ Architecture & Data Logic
The core of this project lies in filtering high-value liquidity movements on the Ethereum network.

* **Data Source:** `erc20_ethereum.evt_Transfer`.
* **Whale Threshold:** Single transactions $\ge$ **$1,000,000 USDC**.
* **Time Window:** Rolling **24-hour** analysis.

<div align="center">
  <img src="whale_inflow_counter.jpg" width="850" alt="Counter Analytics" />
  <p><i>Figure 1: Real-time Inflow Counter showing institutional accumulation.</i></p>
</div>

## 📈 Visual Methodology
To ensure the data is actionable, we implemented two distinct layers of visualization:

1.  **Macro View (Counter):** Focuses on the "Big Picture" – total capital entry.
2.  **Micro View (Bar Chart):** Analyzes volatility and peaks. Notice the massive spikes at **6,214** and **5,737** units, indicating coordinated whale entries.

<div align="center">
  <img src="whale_activity_chart.jpg" width="850" alt="Whale Analysis Chart" />
  <p><i>Figure 2: Hourly breakdown of transaction value ($).</i></p>
</div>

## 📂 Asset Guide (How to add more)
To keep this repository clean, use the following syntax for new assets:

| Asset Type | Markdown/HTML Syntax |
| :--- | :--- |
| **Images** | `<img src="filename.jpg" width="600">` |
| **Links** | `[Text](URL)` |
| **Reports** | `[Download PDF](Institutional_USDC_Whale_Analysis_Dune.pdf)` |

<br />

<div align="center">
  <hr />
  <p>Generated for the <b>Web3 Data Portfolio</b> | 2026</p>
</div>
