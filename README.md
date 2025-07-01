# Hotel Business Analytics: Revenue, Parking, and Seasonality Insights

![image](https://github.com/user-attachments/assets/c36ea1bf-7f13-47c7-9094-c2a15bb1f0e6)



## Author: Sebastian Ortuno Barrero

## Overview
This project analyzes hotel business data from 2018 to 2020 to help the company understand its performance and make better decisions. The company operates two types of hotels : City Hotels and Resort Hotels, and wanted answers to three key questions:

1. Is the hotel revenue growing year over year?  
2. Should the hotel increase the size of its parking lot?  
3. What seasonal patterns can be seen in revenue and guest behavior?

---

## Tools Used
- **SQL Server Management Studio (SSMS)** for data exploration and preparation  
- **Power BI** for creating interactive dashboards and visualizations

## Data Overview:

- **Year_2018**: Hotel data for 2018, with 32 columns and 21,996 rows.  
- **Year_2019**: Hotel data for 2019, with 32 columns and 79,264 rows.  
- **Year_2020**: Hotel data for 2020, with 32 columns and 40,687 rows.  
- **dbo.market_segment**: Information about 8 types of discounts offered by the hotel.  
- **dbo.meal_cost**: Details about 4 meals offered plus one undefined meal type.

# Key insights:
## 1. Is their hotel revenue growing by year?
- To have a better understanding of the revenue year by year, we can take a look to this table created in power BI and SSMS:


![image](https://github.com/user-attachments/assets/37bd44a8-dae8-4bbb-9973-b333a5c95a1a)


- Both hotels saw revenue growth from 2018 to 2019.  
- In 2020, revenue dropped significantly, likely due to the COVID-19 pandemic impacting travel.  
- City Hotels generated more revenue than Resort Hotels in 2019 and 2020.  
- Resort Hotels earned more in 2018 but experienced a larger drop later.

## 2. Should the hotel increase the parking lot?

![image](https://github.com/user-attachments/assets/12d27a3c-aac5-4c70-b1b4-03389db6cbfe)

- Only 8.63% of all reservations requested parking.  
- The Resort Hotel had the highest parking requests in 2020 at 16.55%.  
- Parking demand decreased from 9.50% in 2018 to 7.52% in 2020.  
- This suggests expanding the parking lot is not necessary at this time.


## 3. Seasonal Revenue Trends

![image](https://github.com/user-attachments/assets/e63b8940-253a-4a24-b4ad-9407da3be7f1)

- Resort Hotels show strong revenue peaks in summer months (around July), likely driven by vacation travel.  
- City Hotels maintain steadier revenue throughout the year, indicating consistent business travel demand.  
- Revenue generally increased from 2018 through mid-2019 before declining in early 2020.

## Conclusion

This project provided valuable insights into the hotel business by analyzing data from 2018 to 2020 using SQL Server Management Studio (SSMS) and Power BI.

- **Revenue Trends**: Both hotel types saw revenue growth in 2019, followed by a significant decline in 2020, likely due to the COVID-19 pandemic. City Hotels outperformed Resort Hotels in revenue for 2019 and 2020.
- **Parking Demand**: Only 8.63% of total reservations requested parking, with a downward trend over time. This suggests that expanding the parking lot is not currently justified.
- **Seasonality**: Resort Hotels show strong seasonal peaks in summer months, while City Hotels maintain more stable revenue throughout the year. This reflects differing customer behavior and market segments.

These findings help guide data-driven decisions for revenue optimization and resource allocation in the hotel business.



