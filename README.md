# Hotel-Business-Project

![image](https://github.com/user-attachments/assets/c36ea1bf-7f13-47c7-9094-c2a15bb1f0e6)



## Author: Sebastian Ortuno Barrero

This project is about a hotel business that requires a data analyst service to understand their data and get to know business requirements from the company. The owners of this busines want to know three specific insights:

- Is the hotel revenue growing by year?
- Should the hotel increase the parking lot?
- What trends does the data present on average daily rate and guests to explore seasonability?

  For this project I used SSMS to do some data exploration and Power BI to make an easy understandable dashboard for the hotel owners.

## Data Overview:

 - The data that the company provide was of five tables.
 - Year_2018: This table contains all the information of the hotel business during 2018. It is classified in 32 columns and 21,996 rows. 
 - Year_2019: This table contains all the information of the hotel business during 2019. It is classified in 32 columns and 79,264 rows. 
 - Year_2020: This table contains all the information of the hotel business during 2019. It is classified in 32 columns and 40,687 rows.
 - dbo.market_segment: This table contains all the information about discounts that the business offers. The company offers 8 different tyoes of discounts.
 - dbo.meal_cost: This table contains the meals that are offered in hotels. It contains 4 meals and one meal that is undefined.

# Business Requirements:
## 1. Is their hotel revenue growing by year?
- To have a better understanding of the revenue year by year, we can take a look to this table created in power BI and SSMS:

![image](https://github.com/user-attachments/assets/870239f2-c367-4abb-a5ba-c408ac25333a)


![image](https://github.com/user-attachments/assets/37bd44a8-dae8-4bbb-9973-b333a5c95a1a)


- Analyzing the data we can observe that the revenue for both hotels increased in 2019 but had a significant drop in 2020.
- In 2020 the world experienced the COVID-19 Pademic, which can be a factor of why the revenue from both hotels drop down that year.
- City Hotel generates more revenue than Resort Hotel in 2019 and 2020.
- Resort Hotel has a higher revenue in 2018.
- In 2019, City Hotel generated a significant growing revenue of $8,991,311.54.
- In 2019, Resort Hotel also experienced a growing revenue of $6,311,680.8.

## 2. Should the hotel increase the parking lot?

![image](https://github.com/user-attachments/assets/12d27a3c-aac5-4c70-b1b4-03389db6cbfe)

- Out of the 100,687 reservations, only 8.63% requested a car parking.
- In 2020 the Resort Hotel had the most percentage of parking request. It was 16.55% out of 22,825 reservations in that year.
- There is a decreasing trend from 9.50% in 2018 to 7.52% in 2020.
- This suggests that expanding the parking lot may not be necessary.


## 3. What are the revenue trends in the data?

![image](https://github.com/user-attachments/assets/e63b8940-253a-4a24-b4ad-9407da3be7f1)

- Revenue trends for both hotel types fluctuate seasonally, with peaks and valleys over time.
- Resort Hotels (orange line) show strong revenue spikes during the summer months (around July) of each year, indicating strong seasonal demand likely related to vacations.
- City Hotels (blue line) maintain a steadier revenue throughout the year with less dramatic peaks, suggesting more consistent business travel or urban demand.
-  Revenue for both hotel types generally rises from 2018 through mid-2019, followed by some fluctuations.
- Noticeable decline in revenue for both hotel types starting early 2020, likely reflecting the impact of COVID-19 pandemic on travel and hospitality.
- Resort hotels have higher peaks but lower troughs compared to city hotels, consistent with their more seasonal business model.

## Conclusion

This project provided valuable insights into the hotel business by analyzing data from 2018 to 2020 using SQL Server Management Studio (SSMS) and Power BI.

- **Revenue Trends**: Both hotel types saw revenue growth in 2019, followed by a significant decline in 2020, likely due to the COVID-19 pandemic. City Hotels outperformed Resort Hotels in revenue for 2019 and 2020.
- **Parking Demand**: Only 8.63% of total reservations requested parking, with a downward trend over time. This suggests that expanding the parking lot is not currently justified.
- **Seasonality**: Resort Hotels show strong seasonal peaks in summer months, while City Hotels maintain more stable revenue throughout the year. This reflects differing customer behavior and market segments.

These findings help guide data-driven decisions for revenue optimization and resource allocation in the hotel business.



