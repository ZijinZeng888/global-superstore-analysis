# Global Superstore Sales Analysis (R)

Exploratory data analysis and visualization of a global retail dataset using R and ggplot2.

## Dataset

- **Source:** [Global Superstore Sales Dataset – Kaggle](https://www.kaggle.com/datasets/tassawarabbas/global-superstore-sales-dataset)
- **Records:** 51,290 orders
- **Period:** 2011 – 2014
- **Coverage:** 140+ countries across 4 regions
- **Key columns:** Sales, Profit, Category, Sub-Category, Region, Segment, Discount, Shipping Cost, Ship Mode

> Note: The raw CSV is not included due to file size. Download from the Kaggle link above and place it in `~/Downloads/` before running the script.

## Tools

- R 4.5.1
- tidyverse (dplyr, ggplot2, readr)
- lubridate

## Project Structure

```
global-superstore-analysis/
├── README.md
└── global_superstore_analysis.R
```

## Visualizations

### 1. Annual Sales Trend (2011–2014)
Sales grew consistently year-over-year, nearly doubling from 2011 to 2014.

### 2. Sales by Category
Technology led in total sales, followed by Furniture and Office Supplies.

### 3. Profit by Region
Central region generated the highest profit. All regions were profitable.

### 4. Discount vs Profit
Higher discount rates are negatively correlated with profit — orders with discounts above 0.4 frequently resulted in losses.

### 5. Sales by Category and Year
Technology showed the steepest growth trajectory across all four years.

## Key Findings

- Total sales grew from ~$2.3M (2011) to ~$4.3M (2014)
- Technology is the highest-revenue category but also carries the highest price points
- Excessive discounting (>40%) consistently leads to negative profit margins
- Central region outperforms all other regions in profitability

## R Concepts Covered

- Data loading and cleaning with `read.csv` and `dplyr::rename`
- Aggregation with `group_by` and `summarise`
- Data transformation with `mutate`
- Pipe operator `%>%`
- Visualization with `ggplot2`: `geom_line`, `geom_col`, `geom_point`, `geom_smooth`
- Plot customization: `theme_minimal`, `scale_fill_manual`, `coord_flip`, `labs`
