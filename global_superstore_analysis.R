# =============================================
# Global Superstore Sales Analysis
# Dataset: 51,290 orders, 2011-2014
# Tools: R, tidyverse, ggplot2
# =============================================

library(tidyverse)
library(lubridate)

# --- Load & Clean Data ---
df <- read.csv("~/Downloads/Global Superstore.csv", stringsAsFactors = FALSE)

df <- df %>%
  rename(
    sales = Sales,
    profit = Profit,
    category = Category,
    sub_category = Sub.Category,
    region = Region,
    segment = Segment,
    quantity = Quantity,
    discount = Discount,
    shipping_cost = Shipping.Cost,
    market = Market,
    order_priority = Order.Priority,
    ship_mode = Ship.Mode,
    year = Year
  )

# --- Exploration ---
table(df$year)

# --- Analysis & Visualization ---

# 1. Annual Sales Trend
yearly_sales <- df %>%
  group_by(year) %>%
  summarise(total_sales = sum(sales),
            total_profit = sum(profit))

ggplot(yearly_sales, aes(x = year, y = total_sales)) +
  geom_line(color = "steelblue", size = 1.2) +
  geom_point(color = "steelblue", size = 3) +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Annual Sales Trend (2011-2014)",
       x = "Year", y = "Total Sales") +
  theme_minimal()

# 2. Sales by Category 
category_sales <- df %>%
  group_by(category) %>%
  summarise(total_sales = sum(sales),
            total_profit = sum(profit),
            profit_margin = total_profit / total_sales * 100)

ggplot(category_sales, aes(x = reorder(category, total_sales), y = total_sales, fill = category)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Sales by Category",
       x = "Category", y = "Total Sales") +
  theme_minimal() +
  theme(legend.position = "none")

# 3. Profit by Region
region_profit <- df %>%
  group_by(region) %>%
  summarise(total_sales = sum(sales),
            total_profit = sum(profit))

ggplot(region_profit, aes(x = reorder(region, total_profit), y = total_profit, fill = total_profit > 0)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  scale_fill_manual(values = c("TRUE" = "steelblue", "FALSE" = "tomato")) +
  labs(title = "Profit by Region",
       x = "Region", y = "Total Profit") +
  theme_minimal() +
  theme(legend.position = "none")

# 4. Discount vs Profit
ggplot(df, aes(x = discount, y = profit)) +
  geom_point(alpha = 0.3, color = "steelblue") +
  geom_smooth(method = "lm", color = "tomato") +
  labs(title = "Discount vs Profit",
       x = "Discount Rate", y = "Profit") +
  theme_minimal()

# 5. Sales by Category and Year
category_year <- df %>%
  group_by(year, category) %>%
  summarise(total_sales = sum(sales), .groups = "drop")

ggplot(category_year, aes(x = factor(year), y = total_sales, fill = category)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Sales by Category and Year",
       x = "Year", y = "Total Sales", fill = "Category") +
  theme_minimal()