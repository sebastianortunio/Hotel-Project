# Hotel-Business-Project

![image](https://github.com/user-attachments/assets/43f0e043-74e8-446d-a735-9b1d0be3da0f)

## Author: Sebastian Ortuno Barrero

This project is about a hotel business that requires a data analyst service to understand their data and get to know business requirements from the company. The owners of this busines want to know three specific insights:

- Is the hotel revenue growing by year?
- Should the hotel increase the parking lot?
- What trends does the data present on average daily rate and guests to explore seasonability?

  For this project I used SSMS to do some data exploration and Power BI to make an easy understandable dashboard for the hotel owners.

### Data Overview:

 - The data that the company provide was of five tables.
 dbo.2018$: This table contains all the information of the hotel business during 2018. It is classified in 32 columns and 21,996 rows. 
 dbo.2019$: This table contains all the information of the hotel business during 2019. It is classified in 32 columns and 79,264 rows. 
 dbo.2020$: This table contains all the information of the hotel business during 2019. It is classified in 32 columns and 40,687 rows.
 dbo.market_segment$: This table contains all the information about discounts that the business offers. The company offers 8 different tyoes of discounts.
 dbo.meal_cost$: This table contains the meals that are offered in hotels. It contains 4 meals and one meal that is undefined.

## Business Requirements:
### Is their hotel revenue growing by year?
To have a better understanding of the revenue year by year, we can take a look to this table created in power BI and SSMS:

![image](https://github.com/user-attachments/assets/fc70a180-bb40-4304-a780-0313a6e38b7c)
![image](https://github.com/user-attachments/assets/37bd44a8-dae8-4bbb-9973-b333a5c95a1a)


-- Analyzing the data we can observe that the revenue for both hotels increased in 2019 but had a significant drop in 2020.
-- In 2020 the world experienced the COVID-19 Pademic, which can be a factor of why the revenue from both hotels drop down that year.
-- City Hotel generates more revenue than Resort Hotel in 2019 and 2020.
-- Resort Hotel has a higher revenue in 2018.
-- In 2019, City Hotel generated a significant growing revenue of 8,991,311.54.
-- In 2019, Resort Hotel also experienced a growing revenue of 6,311,680.8.
