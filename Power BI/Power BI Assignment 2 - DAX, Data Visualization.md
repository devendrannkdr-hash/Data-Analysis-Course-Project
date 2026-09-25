# Power BI Assignment 2 – DAX & Data Visualization

## E-Commerce Sales Analysis

This README documents the assignment **question-wise**, in the same order as the assignment instructions, with the Power BI steps, DAX formulas used, and the purpose of each result.

---

# Part 1 – Calculated Columns

## Question 1 – Create a Calculated Column for `Category Type`

### Requirement
Create a calculated column in the **Order Details** table that combines `Category` and `Sub-Category` into one `Category Type` column.

### Steps

1. Open **Power BI Desktop**.
2. Go to **Data view**.
3. Select the **Order Details** table.
4. Select **Table tools / New column**.
5. Enter the following DAX:

```DAX
Category Type =
'Order Details'[Category] & " - " & 'Order Details'[Sub-Category]
```

6. Press **Enter**.
7. Verify that the new `Category Type` column contains values such as:
   - Clothing - Handkerchief
   - Clothing - Bookcases
   - Electronics - Printers

### Result
The Category and Sub-Category are combined into one field for analysis.

---

## Question 2 – Calculate `Revenue per Order`

### Requirement
Create a calculated column in **Order Details** to calculate revenue using:

**Amount × Quantity**

### Steps

1. Select the **Order Details** table.
2. Select **New column**.
3. Enter:

```DAX
Revenue per Order =
'Order Details'[Amount] * 'Order Details'[Quantity]
```

4. Press **Enter**.
5. Format the column as a suitable currency/decimal format.

### Result
Each order-detail row receives a calculated revenue value.

Example:

If Amount = ₹12 and Quantity = 2:

**Revenue per Order = ₹12 × 2 = ₹24**

---

## Question 3 – Create `Sales Category`

### Requirement
Categorize each order as **Above Average** or **Below Average** based on the Amount value.

### Steps

1. Select **Order Details**.
2. Select **New column**.
3. Enter:

```DAX
Sales Category =
IF(
    'Order Details'[Amount] >=
        AVERAGE('Order Details'[Amount]),
    "Above Average",
    "Below Average"
)
```

4. Press **Enter**.
5. Verify that the new column contains the two categories.

### Result

- Amount greater than or equal to the overall average → **Above Average**
- Amount below the overall average → **Below Average**

---

# Part 2 – Calculated Measures

## Question 4 – Calculate `Order Count`

### Requirement
Create a measure to count the total number of orders in the Order Details table.

### Steps

1. Select the **Order Details** table.
2. Select **New measure**.
3. Enter:

```DAX
Order Count =
DISTINCTCOUNT('Order Details'[Order ID])
```

4. Press **Enter**.
5. Use the measure in a Card, table, or other visual when required.

### Result
The measure counts distinct Order IDs instead of counting repeated order-detail rows.

---

## Question 5 – Calculate `Average Profit in Delhi`

### Requirement
Create a measure to calculate the average profit for orders placed in Delhi.

### Steps

1. Select the **Order Details** table.
2. Select **New measure**.
3. Enter:

```DAX
Average Profit in Delhi =
CALCULATE(
    AVERAGE('Order Details'[Profit]),
    'List of Orders'[City] = "Delhi"
)
```

4. Press **Enter**.

### Result
`CALCULATE` applies the Delhi city filter and then calculates the average Profit.

The formula uses `List of Orders[City]` because City is stored in the List of Orders table and the model relationship allows the filter to affect the order details.

---

## Question 6 – Calculate `YTD Sales`

### Requirement
Calculate the total sales amount accumulated from the beginning of the year up to each order date.

### Steps

1. Select the **Order Details** table.
2. Select **New measure**.
3. Enter:

```DAX
YTD Sales =
CALCULATE(
    SUM('Order Details'[Amount]),
    DATESYTD('List of Orders'[Order Date])
)
```

4. Press **Enter**.
5. Use the measure with Order Date in a time-based visual or matrix.

### Result
`DATESYTD` calculates the sales accumulated from the beginning of the year through the current date context.

### Important
The DAX used in the submitted Power BI evidence uses:

```DAX
'List of Orders'[Order Date]
```

for the YTD date column.

---

# Part 3 – Data Modeling / Supporting Calculations

The assignment notes that data modeling should be completed before visualization.

## Step 7 – Create the Date Table

A Date Table was created to support time-based analysis.

### DAX

```DAX
Date_Table =
CALENDAR(
    MIN('List of Orders'[Order Date]),
    MAX('List of Orders'[Order Date])
)
```

### Steps

1. Go to **Modeling / Table tools**.
2. Select **New table**.
3. Enter the DAX above.
4. Press **Enter**.
5. Verify that the Date table contains continuous dates.

The evidence shows the Date Table containing **365 dates**.

---

## Step 8 – Create the Sales Target Key

The Sales Target table contains monthly targets by Category.

### DAX

```DAX
sales_target Key =
FORMAT(
    'Sales target'[Month of Order Date],
    "MMM-YYYY"
)
& "-"
& 'Sales target'[Category]
```

### Steps

1. Select **Sales target**.
2. Select **New column**.
3. Enter the DAX above.
4. Press **Enter**.

### Example

A row containing:

- Month = April 2018
- Category = Clothing

produces:

`Apr-2018-Clothing`

---

## Step 9 – Create the Matching Key in `Order Data`

The corresponding key is created in the Order Data table.

### DAX

```DAX
or_sales taget key =
FORMAT(
    'Order Data'[List of Orders.Order Date],
    "MMM-YYYY"
)
& "-"
& 'Order Data'[Category]
```

### Result

The Order Data key has the same format as the Sales Target key, for example:

`Apr-2018-Clothing`

This allows monthly category target information to be matched with the order data.

---

# Part 4 – Data Visualization

## Question 7 – Sales Target Achievement by Category

### Requirement
Compare actual sales with sales targets by category using a clustered column chart.

### Steps

1. Go to **Report view**.
2. Insert a **Clustered column chart**.
3. Put **Category** on the X-axis.
4. Put **Target** in the Y-axis/Values.
5. Put actual sales amount in the Y-axis/Values.
6. Rename the title to:

**Sales Target Achievement by Category**

### Result
The chart compares Target and Actual Sales for:

- Clothing
- Furniture
- Electronics

---

## Question 8 – Max Profit Margin by Sub-Category

### Requirement
Analyze the maximum Profit Margin for each Sub-Category using a donut chart.

### Steps

1. Insert a **Donut chart**.
2. Put **Sub-Category** in Legend/Details.
3. Put **Profit Margin** in Values.
4. Change the aggregation to **Maximum**.
5. Rename the title to:

**Max of Profit Margin by Sub-Category**

### Result
Each donut segment represents a Sub-Category and its maximum Profit Margin.

---

## Question 9 – Monthly Sales Trend

### Requirement
Show the monthly sales trend over time using a line chart.

### Steps

1. Insert a **Line chart**.
2. Put **Order Date** on the X-axis.
3. Use the date hierarchy/year and month so that the chart displays monthly values.
4. Put **Amount** in Values.
5. Rename the title to:

**Monthly Sales Trend**

### Result
The chart displays the monthly movement in sales across the available period.

---

## Question 10 – Profit and Quantity by Sub-Category

### Requirement
Compare the relationship between Profit and Quantity sold using a scatter chart.

### Steps

1. Insert a **Scatter chart**.
2. Put **Quantity** on the X-axis.
3. Put **Profit** on the Y-axis.
4. Put **Sub-Category** in Legend/Details.
5. Rename the title to:

**Profit vs Quantity by Sub-Category**

### Result
The scatter chart shows the relationship between sales quantity and profit for each Sub-Category.

---

## Question 11 – Comparison of Total Sales Amount and Target

### Requirement
Create cards showing total sales amount and total sales target. Also create a multi-row card showing the minimum target for each segment/category.

### A. Total Sales Amount Card

1. Insert a **Card** visual.
2. Add **Amount**.
3. Keep the aggregation as **Sum**.
4. Rename the title:

**Total Sales Amount**

### B. Total Sales Target Card

1. Insert another **Card**.
2. Add **Target**.
3. Use **Sum**.
4. Rename the title:

**Total Sales Target**

### C. Minimum Target by Category

1. Insert a **Multi-row Card**.
2. Add **Category**.
3. Add **Target**.
4. Change Target aggregation to **Minimum**.
5. Rename the visual:

**Comparison of Total Sales Amount and Target**

### Result

The dashboard displays the overall sales amount, overall target, and minimum target by category.

---

## Question 12 – Sales Performance Matrix

### Requirement
Build a matrix comparing actual sales with sales targets across categories and months.

### Steps

1. Insert a **Matrix** visual.
2. Put **Category** in Rows.
3. Put **Year** and **Month** from the Order Date hierarchy in Columns.
4. Put **Target** in Values.
5. Put **Actual Sales / Amount** in Values.
6. Format the matrix so the month level is visible.
7. Rename the visual:

**Sales Performance Matrix**

### Result

The matrix compares Target and Actual Sales by:

- Category
- Year
- Month

The completed dashboard shows the monthly columns across the analysis period.

---

## Question 13 – Geographic Sales Analysis

### Requirement
Visualize total sales on a map by City.

### Steps

1. Insert a map visual.
2. Put **City** in Location.
3. Put **Sales Amount / Sum of Amount** in the sales-size/value field.
4. Use the city location to generate geographic bubbles.
5. Rename the visual:

**Geographic Sales Analysis**

### Result
The map displays sales geographically, with sales amount represented by the bubbles.

---

## Question 14 – Sales Distribution by Sub-Category

### Requirement
Represent sales distribution across Sub-Categories using a treemap.

### Steps

1. Insert a **Treemap**.
2. Put **Sub-Category** in Category/Group.
3. Put **Amount** in Values.
4. Keep the aggregation as **Sum**.
5. Rename the visual:

**Sales Distribution by Sub-Category**

### Result
The size of each treemap section represents the sales amount for that Sub-Category.

---

## Question 15 – Order Count Analysis by State

### Requirement
Create a funnel chart showing the distribution of order counts across states.

### Steps

1. Insert a **Funnel chart**.
2. Put **State** in Category.
3. Put **Order Count** in Values.
4. Rename the visual:

**Order Count by State**

### Result
The funnel visual displays order counts across different states.

---

# Final Dashboard

The completed dashboard contains the required analysis visuals:

- Sales Target Achievement by Category
- Max Profit Margin by Sub-Category
- Monthly Sales Trend
- Profit vs Quantity by Sub-Category
- Total Sales Amount
- Total Sales Target
- Minimum Target by Category
- Sales Performance Matrix
- Geographic Sales Analysis
- Sales Distribution by Sub-Category
- Order Count by State

Additional profit-related analysis is also included in the dashboard.

## Key Dashboard Values

The completed dashboard displays:

- **Total Sales Amount:** ₹4,31,502
- **Total Sales Target:** ₹4,35,900