# 🚴‍♂️ Cyclistic Bike-Share Program
## Company Overview

### Background:

Cyclistic, a leading bike-share provider, launched its successful program in 2016. Over the years, Cyclistic has expanded significantly, establishing itself as a major player in urban transportation. The program now boasts a fleet of 5,824 bicycles distributed across 692 strategically placed stations throughout Chicago.

### Operational Model:

Bicycle Fleet: 5,824 bikes 🚲

Station Network: 692 stations 🗺️

Flexibility: Bikes can be unlocked at one station and returned to any other station within the network.

### Membership:

The company utilized various pricing plans to cater to different customer needs, including:

**Casual Riders**: Individuals who purchase single-ride or full-day passes. These riders typically use the service on an as-needed basis.

**Cyclistic Members**: Customers who opt for annual memberships, indicating a higher frequency of use and a long-term commitment to the bike-share program.

### My role 👩‍💻

In this scenario, I work at Cyclistic as a junior data analyst, and the main objective assigned to my team is to create marketing plans.

### Objectives 

By Analysing the data, developing marketing tactics to convert casual riders into members.

In order to answer the business questions, we follow these steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Data Analysis Process:

### Stage 1: Ask ❓
Define the final list of questions to analyze.

### Stage 2: Prepare 🛠️
Use Cyclistic's historical trip data from January to December 2023.
Organize the files in a folder named ‘Divvy_TripData_2023’ and make a backup copy.

### Stage 3: Process 🔧
Clean and prepare the data in Microsoft Excel and R.
Ensure data reliability and quality using the ROCCC method.

### Stage 4: Analyze 🔍
Perform descriptive analysis, ride length analysis, and time analysis.
Generate insights from data on ride patterns, bike types, user types, and popular stations.

### Stage 5: Share 📊
Create visualizations using R.
Develop a Tableau dashboard for proper visualization.

### Stage 6: Act 🚀
Summarize findings and provide recommendations

### Detailed Steps 📝

## Stage 1: Ask ❓

The final list of questions to analyze are:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

## Stage 2: Prepare 🛠️

For this analysis, we are using the Cyclistics historical trip data [link to dataset](https://divvy-tripdata.s3.amazonaws.com/index.html) from 2023 January (202212-divvy-tripdata.zip) to 2023 December (202311-divvy-tripdata.zip). To organize the files, we move the files in folder named as ‘Divvy_TripData_2023’. 

And, we extract all files under the above folder. Then, the files were organized and renamed for easier handling:
-	202301-divvy-tripdata.csv – 2023_Jan_ride
-	202302-divvy-tripdata.csv – 2023_Feb_ride
-	202303-divvy-tripdata.csv– 2023_Mar_ride
-	202304-divvy-tripdata.csv– 2023_April_ride
-	202305-divvy-tripdata.csv– 2023_May_ride
-	202306-divvy-tripdata.csv– 2023_Jun_ride
-	202307-divvy-tripdata.csv– 2023_Jul_ride
-	202308-divvy-tripdata.csv– 2023_Aug_ride
-	202309-divvy-tripdata.csv– 2023_Sep_ride
-	202310-divvy-tripdata.csv– 2023_Oct_ride
-	202311-divvy-tripdata.csv– 2023_Nov_ride
-	202312-divvy-tripdata.csv– 2023_Dec_ride

To avoid future accident, we also make a copy of all files in different folder named as “Copy_Divvy_TripData_2023”.

### Metadata Description 🗃️

The dataset includes the following fields:
-	ride_id: The ID of the ride
-	rideable_type: The type of bikes
-	started_at: Starting date of the ride
-	ended_at: Ending date of the ride
-	start_station_name: The name of the station where the ride starts
-	start_station_id: The ID of the station where the ride starts
-	end_station_name: The name of the station where the ride ends
-	end_station_id: The ID of the station where the ride ends
-	start_lat: The latitude of the starting location
-	start_lng: The longitude of the starting location
-	end_lat: The latitude of the ending location
-	end_lng: The longitude of the ending location
-	member_casual: The type of membership (Casual or Member)

### Data Reliability and Quality 📉

The dataset is considered a good data source based on the ROCCC method:
-	Reliability: The dataset includes over 5 million trip records annually.
-	Originality: The dataset is collected and made available by Motivate International Inc.
-	Comprehensiveness: The dataset covers various aspects of each trip, including membership status, ride date and time, start and end locations, and ride duration.
-	Current: The dataset is from 2023 and is updated monthly.
-	Cited: The dataset is properly cited.

(****Note***: The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).*)

## Stage 3: Process 🔧

### Data Cleaning and Preparation in Microsoft Excel

The following steps were performed to clean and prepare the data:

### Finding and Removing Blank Values:
-	Navigate to Home > Find & Select > Go to Special > Blanks.
-	Delete rows with blank cells using Home > Delete > Delete Sheet Rows.

### Removing Duplicate Values:
-	Use Data > Remove Duplicates to ensure no duplicate records.

### Calculating Ride Duration:
-	Add a new column named ride_length to calculate the duration of each ride by subtracting started_at from ended_at.
-	Format the new column as HH:MM:SS using Format > Cells > Time.

### Determining the Day of the Week:
-	Add a new column named day_of_week to reflect the day of the week a ride started.
-  Use the formula =TEXT(started_at, "dddd") to display the full name of the day (e.g., "Monday", "Tuesday").

### Repeating the Cleaning Steps:
-  Apply the above cleaning steps to each monthly file.

### Data Cleaning in R

The following steps were performed to clean and prepare the data for analysis:
1.	Loaded necessary libraries for data manipulation and visualization.
2.	Loading Data: The data for each month was loaded into separate data frames.
3.	Data Inspection: The structure and contents of each data frame were inspected to ensure consistency.
4.	Merging Data: All monthly data frames were merged into a single data frame.
5.	Data Cleaning:
       - Removed null values.
       - Removed duplicate records.
       - Filtered out rides with non-positive durations.
6.	Data Transformation:
       - Converted time-related fields to appropriate date and time formats.
       - Added new columns for month, day, year, and day of the week.
       - Created a new column for ride duration in minutes.

## Stage 4: Analyze 🔍

### Descriptive Analysis

**Ride Length Analysis**: In this analysis, we analyze the max,min,average and median of ride length.

-	Maximum Ride Length: Maximum ride duration in minutes.
-	Minimum Ride Length: Minimum ride duration in minutes.
-	Average Ride Length: Mean ride duration in minutes.
-	Median Ride Length: Median ride duration in minutes

**Ride count by other factors**:
-	Unique Ride Count: Number of unique rides.
-	Ride Count by Bike Type: Number of rides for each bike type.
-	Ride Count by User Type: Number of rides for members and casual users.

**Time Analysis**: In this analysis, we focus on understanding ride patterns over different times of the day, days of the weeks and months.
-	Average Ride Duration by Rideable Type: Calculation of the average ride duration by rideable type.
-	Distribution of Rides Across Different Days of the Week: Arrangement of data for day_of_week and summarization of the total number of rides for each day.
-	Comparison of Ride Lengths Between Member Types: Comparison of average ride lengths and total number of rides between different member types.
-	Number of Subscribers per Month: Calculation of the number of subscribers (both members and casual) for each month.
-	Total Number of Rides per Month: Summarization of the total number of rides for each month.
-	Month-wise Maximum Number of Rides in a Day
-	Calculation of the maximum number of rides in a day for each month, along with the corresponding day.

**Other Analysis**:
-	Summary of Ride Data by Member Type: Grouping and summarization of the number of rides, maximum ride length, minimum ride length, and average ride length by member type.
-	Most Popular Start and End Stations: Identification of the most popular start and end stations overall.
-	Most Popular Start and End Stations by Member Type: Identification of the most popular start and end stations separately for members and casual users.

💎 **Explore the code treasure:** [link to source code](https://github.com/SaileshBasnet/Cyclist_CaseStudy/blob/main/Data_Analysis.R )

## Stage 5: Share 📊

### Visualizations using R

- Total Rides by Month: A bar chart showing the number of rides per month.
- Rides by Bike Type: A bar chart displaying the count of rides for each bike type.
- Rides by User Type: A bar chart showing the number of rides for members and casual users.
- Rides by Bike Type and User Type: A grouped bar chart depicting the count of rides by bike type for each user type.
- Rides by Month, Bike Type, and User Type: A faceted bar chart showing rides by month, bike type, and user type.
- Average Ride Duration by Bike Type: A bar chart showing the average ride duration for each bike type.
- Distribution of Rides by Day of Week: A bar chart displaying the distribution of rides across different days of the week.
- Ride Length Comparison by User Type: A bar chart comparing ride lengths between members and casual users.
- Month-wise Maximum Rides in a Day: A bar chart showing the maximum number of rides in a day for each month.
- Top 10 Popular Start Stations for Members and Casual Riders: Bar charts showing the most popular start stations for each user type.

📜 **Read the full documentation:** [link to R Markdown](http://rpubs.com/Sailesh_Basnet/1209752) 

After having idea of data, we created a Dashboard using Tableau for proper visualization.
The Snippet of dashboard: 

![image](https://github.com/user-attachments/assets/e5dc82b8-06f7-4a48-96e0-fa7bccad8e42)

<p align="center"><strong> Fig: Dashboard Home Page </strong></p>

![image](https://github.com/user-attachments/assets/b6514f22-5925-4f47-8983-e3eec2311ef8)

<p align="center"><strong>Fig: Dashboard Ride Page</strong> </p>

![image](https://github.com/user-attachments/assets/81088300-34a8-4c65-86bc-aa53f73ee23e)

<p align="center"> <strong> Fig: Dashboard Popular Page </strong>  </p>

### Access the Dashboard
📈 You can access the dashboard from the following link: [Tableau Dashboard](https://public.tableau.com/app/profile/sailesh.basnet/viz/Cyclist_Project/Home_Dashboard)

(*Note: For the best experience, use the **Full Screen** mode to view the dashboard properly.*)

## Stage 6: Act 🚀

### Summary of Data
### Types of Rides: 
-	Classic Bikes are the most popular among both users.
-	Electric Bikes are used moderately.
-	Docked Bikes are least used bike. Member doesn’t use Docked Bike. Only Casual rider use them. 
### Number of Rides per Week:
-	Casual rides bikes during weekend and least during work day. They most use ride in Saturday and least in Monday.
-	Member continuously use rides during all day of week. They most use ride in Wednesday and least in Sunday.
### Number of Rides per Month:
-	Casual riders, number of rides is increasing during summer time and least in winter time. They most use rides in July and least in January.
-	Member riders, rides bike throughout the year in balance way with slight increase during summer and least in winter time. They most use rides in August and least in February. 
### Average Ride Length per Day:
-	Casual riders: There are noticeable fluctuation in average ride length per day. The length of ride varies significantly day-to-day. The peak ride is around 253.35 minutes at the beginning of month and least ride is around 205.41 mins.  
-	Member riders: The rides are stable with minor fluctuations. They use ride regularly. The peak ride is around 130.25 mins at the beginning of month and least ride is around 116.74 mins.
### Popular Start and End Stations:
-	Casual Riders: The most popular start station is ‘Streeter Dr & Grand Ave’ and popular end station is ‘Streeter Dr & Grand Ave’.
-	Member riders: The most popular start station is ‘Clinton St & Washington Blvd’ and popular end station is ‘Clinton St & Washington Blvd’.
-	Other Popular Stations are DuSable Lake Shore Dr & Monroe St, Michigan Ave & Oak St, Clark St & Elm St, Kingsbury St & Kinzie St, etc.

## Insights from Data 🔍
These are the highlights we found from the data:

1.	The total number of rides done by both riders are 4335294.
2.	The most popular bikes are classic bike among both riders.
3.	Both riders use almost same time of ride in weekend. But during work day, member riders use maximum number of ride than casual riders.
4.	Both groups use maximum number of rides during summer time and least number of ride during winter time.
5.	The average ride length is 158.96 minutes.
6.	Casual riders spend more average time than casual riders.
7.	Popular stations for casual riders include ‘Streeter Dr & Grand Ave,’ while members prefer ‘Clinton St & Washington Blvd.’

## Recommendation & Suggestions 📈

After analyzing everything we conclude to this decision for further improvement:
-	Start Seasonal Campaigns: Launch summer campaigns during summer time which is also the peak time of rides by offering different types of discounts, package or loyalty points to keep people riding during the winter.

-	Use social media: Use different types of social media platform to promote events, share different updates related to bike sharing progress, engage with users to build trust with them and gather insights on user experience.

-	Enhance Marketing Strategies: Develop targeted marketing programs to reach out different user segments and highlight unique features of bike service. For example, we can target casual riders to take annual membership by describing different types of perks and benefits such as discounts, exclusive promotions etc.

## Next Steps 📅
### 1. Implement Recommendations
- **Launch Seasonal Campaigns:**
  - Introduce summer promotions with discounts and loyalty rewards.
  - Plan winter incentives to maintain user engagement during colder months.
- **Use Social Media:**
  - Create and share content highlighting bike-sharing benefits and current promotions.
  - Initiate polls and surveys to collect user feedback and insights.
- **Enhance Marketing Strategies:**
  - Develop targeted campaigns to convert casual riders into members.
  - Promote the unique features of the bike-sharing service through both digital and traditional marketing channels.

### 2. Track Performance
- **Define Key Metrics:**
  - Evaluate the effectiveness of the new strategies, including user engagement metrics like new sign-ups and ride activity levels such as the number of rides and average ride length.
- **Implement Tracking Tools:**
  - Use analytics dashboards to monitor real-time performance metrics.
  - Collect and review user feedback through surveys and social media.
- **Prepare Performance Reports:**
  - Prepare monthly performance reports to assess the impact of the new strategies.
  - Conduct quarterly reviews to evaluate overall progress and identify trends.

### 3. Continuous Improvement
- **Regular Reviews:**
  - Regularly review performance data and user feedback to determine which strategies are working well and which areas need adjustment.
- **Refine Tactics:**
  - Make necessary adjustments to campaigns, promotions, and operational aspects like bike maintenance and station locations based on data analysis.
- **Monitor and Improve:**
  - Continuously monitor performance metrics and user feedback to ensure the service remains responsive to user needs and continuously improves.
   
## Export Data 📂
### Export Cleaned Data:
•	Export the cleaned and processed data to a CSV file for further analysis and sharing.
