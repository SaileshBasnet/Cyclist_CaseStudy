# Cyclistic Bike-Share Program
## Company Overview

### Background:

Cyclistic, a leading bike-share provider, launched its successful program in 2016. Over the years, Cyclistic has expanded significantly, establishing itself as a major player in urban transportation. The program now boasts a fleet of 5,824 bicycles distributed across 692 strategically placed stations throughout Chicago.

### Operational Model:

Bicycle Fleet: 5,824 bikes
Station Network: 692 stations
Flexibility: Bikes can be unlocked at one station and returned to any other station within the network.

### Membership:

The company utilized various pricing plans to cater to different customer needs, including:

**Casual Riders**: Individuals who purchase single-ride or full-day passes. These riders typically use the service on an as-needed basis.

**Cyclistic Members**: Customers who opt for annual memberships, indicating a higher frequency of use and a long-term commitment to the bike-share program.

### My role:

In this scenario, I work at Cyclistic as a junior data analyst, and the main objective assigned to my team is to create marketing plans.

### Objectives: 

By Analysing the data, developing marketing tactics to convert casual riders into members.

In order to answer the business questions, we follow these steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Data Analysis Process:

### Stage 1: Ask
Define the final list of questions to analyze.

### Stage 2: Prepare
Use Cyclistic's historical trip data from January to December 2023.
Organize the files in a folder named ‘Divvy_TripData_2023’ and make a backup copy.

### Stage 3: Process
Clean and prepare the data in Microsoft Excel and R.
Ensure data reliability and quality using the ROCCC method.

### Stage 4: Analyze
Perform descriptive analysis, ride length analysis, and time analysis.
Generate insights from data on ride patterns, bike types, user types, and popular stations.

### Stage 5: Share
Create visualizations using R.
Develop a Tableau dashboard for proper visualization.

### Stage 6: Act
Summarize findings and provide recommendations

## Detailed Steps: 

### Stage 1: Ask

The final list of questions to analyze are:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### Stage 2: Prepare

For this analysis, we are using the Cyclistics historical trip data [link](https://divvy-tripdata.s3.amazonaws.com/index.html) from 2023 January(202212-divvy-tripdata.zip) to 2023 December(202311-divvy-tripdata.zip). To organize the files, we move the files in folder named as ‘Divvy_TripData_2023’. 

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

### Metadata Description

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

### Data Reliability and Quality

The dataset is considered a good data source based on the ROCCC method:
-	Reliability: The dataset includes over 5 million trip records annually.
-	Originality: The dataset is collected and made available by Motivate International Inc.
-	Comprehensiveness: The dataset covers various aspects of each trip, including membership status, ride date and time, start and end locations, and ride duration.
-	Current: The dataset is from 2023 and is updated monthly.
-	Cited: The dataset is properly cited.

(****Note***: The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).*)


