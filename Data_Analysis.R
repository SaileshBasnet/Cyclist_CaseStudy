# Load the required Packages
library(tidyverse) # Data manipulation
library(dplyr) # Data wrangling
library(tidyr) # Data tidying
library(ggplot2) # Data visualization
library(readr) #Data reading
library(lubridate) #  Date handling
library(janitor) # Data cleaning
library(skimr) # Data Summarization
library(anytime) # Date Parsing
library(hms) # For time objects


# Loading  CSV Files
jan_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Jan_ride.csv")
head(jan_2023)


feb_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Feb_ride.csv")
head(feb_2023)


mar_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Mar_ride.csv")
head(mar_2023)

apr_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Apr_ride.csv")
head(apr_2023)

may_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_May_ride.csv")
head(may_2023)

jun_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Jun_ride.csv")
head(jun_2023)

jul_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Jul_ride.csv")
head(jul_2023)

aug_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Aug_ride.csv")
head(aug_2023)

sep_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Sep_ride.csv")
head(sep_2023)

oct_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Oct_ride.csv")
head(oct_2023)

nov_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Nov_ride.csv")
head(nov_2023)

dec_2023 <- read.csv("D:\\Docs\\Google Data Analytics\\divvy_trip_2023\\2023_Ride_Record\\2023_Dec_ride.csv")
head(dec_2023)

# confirming datatypes are consistent in all data sets before combining them
compare_df_cols(jan_2023,feb_2023,mar_2023,apr_2023,may_2023,jun_2023,jul_2023,
                aug_2023,sep_2023,oct_2023,nov_2023,dec_2023, return = "mismatch")


# Merge Data Frame into single Data Frame
ride_2023 <- bind_rows(jan_2023,feb_2023,mar_2023,apr_2023,may_2023,jun_2023,jul_2023,
                       aug_2023,sep_2023,oct_2023,nov_2023,dec_2023)
View(ride_2023)

# Function to get summary of the dataframe.
summary(ride_2023)
skim_without_charts(ride_2023)
glimpse(ride_2023)
head(ride_2023)
str(ride_2023)
as_tibble(ride_2023)

# To perform meaningful arithmetic analysis, add the column with ride_length value but in minutes
# Function to convert HH:MM:SS format to seconds
time_to_seconds <- function(time_str) {
  time_parts <- as.numeric(strsplit(time_str, ":")[[1]])
  hours <- time_parts[1]
  minutes <- time_parts[2]
  seconds <- time_parts[3]
  total_seconds <- hours * 3600 + minutes * 60 + seconds
  return(total_seconds)
}

# Use mutate from dplyr to create ride_length_minutes
ride_2023 <- ride_2023 %>%
  mutate(
    ride_length_minutes = sapply(ride_length, time_to_seconds) / 6
    
  )

# Rounding up decimal points to two places
ride_2023$ride_length_minutes=round(ride_2023$ride_length_minutes,2)

# Create a copy of dataframe
ride_2023V2 <- ride_2023


# Clean the data
# Remove values with null value
ride_2023V2 <- na.omit(ride_2023)

# Remove the duplicate value
ride_2023V2 <- distinct(ride_2023)

# Remove values of ride_length which has value less than or equal to 0
ride_2023V2 <- ride_2023 [!(ride_2023$ride_length<=0),]
summary(ride_2023V2)
View(ride_2023V2)

# Convert to Date object
date <- as.Date(ride_2023V2$started_at, format = "%m/%d/%Y %H:%M")

# Assuming ride_2023 is your data frame and started_at is a column in it
ride_2023V2$date <- as.Date(ride_2023V2$started_at, format = "%m/%d/%Y %H:%M")
ride_2023V2$month <- format(as.Date(ride_2023V2$date), "%m")
ride_2023V2$day <- format(as.Date(ride_2023V2$date), "%d")
ride_2023V2$year <- format(as.Date(ride_2023V2$date), "%Y")

# Analyze
# Descriptive analysis
# Maximum ride length
max_ride_length <- ride_2023V2 %>% summarize(max_ride_length = max(ride_length_minutes))

# Min ride length
min_ride_length <- ride_2023V2 %>% summarise(min_ride_length= min(ride_length_minutes))

# Average ride length
avg_ride_length <- ride_2023V2 %>% summarise(avg_ride_length=mean(ride_length_minutes))

# Median ride length
med_ride_length <- ride_2023V2 %>%  summarise(med_ride_length=median(ride_length_minutes))

# Ride count by other factors
# Count Unique Ride by ride_id
ride_2023V2 %>%
  distinct(ride_id) %>% count()

# Count no of ride by rideable type
ride_2023V2 %>%  count(rideable_type)

# Count no of ride by member casual
ride_2023V2 %>% count(member_casual)

# Arrange,rename,count no of ride by rideable type and member casual
ride_2023V2 %>% group_by(member_casual) %>% count(rideable_type) %>% arrange(n) %>% 
  rename(total_rides=n)

# Count no of ride by month,rideable type and member
ride_2023V2 %>% group_by(month,member_casual,rideable_type) %>% 
  summarise(no_of_ride=n(),avg_ride_length=mean(ride_length_minutes)) 

# Summarize Member(Member,Casual) Rides by Month
summarize_member <- ride_2023V2 %>% group_by(member_casual,month) %>% filter(member_casual=="member") %>% 
  summarise(no_of_ride=n(),avg_ride_length=mean(ride_length_minutes))
summarize_casual <- ride_2023V2 %>% group_by(member_casual,month) %>% filter(member_casual=="casual") %>% 
  summarise(no_of_ride=n(),avg_ride_length=mean(ride_length_minutes))

# Time analysis
# Average ride duration (ride_length) by rideable type
ride_2023V2 %>% group_by(rideable_type) %>%
  summarise(avg_ride_length=mean(ride_length_minutes))

# Arranging the data of day of week in Sunday, Monday,...etc. format
ride_2023V2$day_of_week <- ordered(ride_2023V2$day_of_week, 
        levels=c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"))

# Analyze the distribution of rides across different days of the week
ride_2023V2 %>% group_by(day_of_week) %>% summarise(total_ride=n())

# Compare ride lengths between members 
ride_2023V2 %>% group_by(member_casual) %>% 
  summarise(avg_ride_length=mean(ride_length_minutes),total = n())

# Count the number of subscriber per month
ride_2023V2 %>% group_by(month) %>% filter(member_casual=="casual") %>% count(member_casual)

ride_2023V2 %>% group_by(month) %>% filter(member_casual=="member") %>% count(member_casual)

# Total no of ride  per month
ride_2023V2 %>% group_by(month) %>% summarise(total_ride=n()) 

# Month-wise maximum number of rides in a day along with the corresponding day
# Count the number of rides for each day within each month
rides_per_day <- ride_2023V2 %>%
  group_by(month, day) %>%
  summarise(num_rides = n())

# Calculating the maximum number of rides in a day (max_ride_in_a_day) for each month
max_rides_per_month <- rides_per_day %>%
  group_by(month) %>%
  summarise(max_ride_in_a_day = max(num_rides), day = which.max(num_rides)) %>% 
  select(month, max_ride_in_a_day, day)

# Othe analysis
# Summarize Ride Data for 2023 by Member Type
ride_2023V2 %>% group_by(member_casual) %>% summarise(no_of_ride=n(),max_ride_length=max(ride_length_minutes),min_ride_length=min(ride_length_minutes),mean_ride_length=mean(ride_length_minutes))

# Most popular start and end station 
# Start station
ride_2023V2 %>% group_by(start_station_name) %>% summarise(no_of_ride=n()) %>%
  arrange(desc(no_of_ride)) 

#End station
ride_2023V2 %>% group_by(end_station_name) %>% summarise(no_of_ride=n()) %>% 
  arrange(desc(no_of_ride))

# Most popular start and end station by member 
# Popular start station for 'member' 
ride_2023V2 %>% group_by(member_casual,start_station_name) %>% filter(member_casual=="member") %>% 
  summarise(no_of_ride=n()) %>%  arrange(desc(no_of_ride))

# Popular end station for 'member'
ride_2023V2 %>% group_by(member_casual,end_station_name) %>% filter(member_casual=="member") %>% 
  summarise(no_of_ride=n()) %>% arrange(desc(no_of_ride))

# Popular start station for 'casual'
ride_2023V2 %>% group_by(member_casual,start_station_name) %>% filter(member_casual=="casual") %>% 
  summarise(no_of_ride=n()) %>% arrange(desc(no_of_ride))

# Popular end station for 'casual'
ride_2023V2 %>% group_by(member_casual,end_station_name) %>% filter(member_casual=="casual") %>% 
  summarise(no_of_ride=n()) %>% arrange(desc(no_of_ride))


#Visualization
# Total no of ride  per month
ride_2023V2 %>% group_by(month) %>% summarise(total_ride=n()) %>% 
  ggplot(aes(x=month,y=total_ride,fill = month))+geom_col()+
  labs(x="Month",y="No of Rides",title = "Total No of Rides by Month")+
  theme_minimal()  


# Total no of ride by rideable type
ride_2023V2 %>% group_by(rideable_type) %>% summarise(no_of_ride=n())%>%
  ggplot(aes(x=rideable_type,y=no_of_ride,fill =rideable_type)) + geom_col()+ 
  labs(x="Type of Ride",y="Count of Rides",title = "No of Rides by Rideable Type") +
  theme_minimal()+scale_fill_discrete(name="Ride Type")


# Total no of ride by member casual
ride_2023V2 %>% group_by(member_casual) %>% summarise(no_of_ride=n()) %>% 
  ggplot(aes(x=member_casual,y=no_of_ride,fill=member_casual))+
  geom_col()+labs(x= "Member Type",y="Count of Rides",title="No of Rides by Member ")+
  theme_minimal()+ scale_fill_discrete(name="Member Type")

# Total no of ride by rideable type and member casual
ride_2023V2 %>% group_by(member_casual,rideable_type) %>% summarise(no_of_ride=n()) %>% 
  ggplot(aes(x=rideable_type,y=no_of_ride,fill = member_casual))+geom_col(position = "dodge2")+
  labs(x="Ride Type",y="Count of Rides",title="No of Rides by Rideable Type and Member")+
  theme_minimal()+scale_fill_discrete(name="Member Type")

# Total no of ride by month,rideable type and member
ride_2023V2 %>% group_by(month,member_casual,rideable_type) %>% 
  summarise(no_of_ride=n(),avg_ride_length=mean(ride_length_minutes)) %>% 
  ggplot(aes(x=month,y=no_of_ride,fill = rideable_type))+geom_col(position = "dodge2")+
  facet_wrap(~member_casual)+labs(x="Month",y="No of Rides",title="No of Ride by Month, Bike Type, Member")+
   scale_fill_discrete(name="Bike Type")+
  theme(
       plot.title = element_text(size = 14), # Increase title size 
       strip.text = element_text(size = 10,face = "bold"),  
       legend.position = "bottom"           
       )

# Summarize Member(Member,Casual) Rides by Month
ride_2023V2 %>% group_by(member_casual,month) %>% 
  summarise(no_of_ride=n(),avg_ride_length=mean(ride_length_minutes)) %>% 
  ggplot(aes(x=month,y=no_of_ride,fill = member_casual))+geom_col(position = "dodge2")+
  labs(x="Month",y="Count of Rides",title = "Summarize Member Rides by Month")+
  facet_wrap(~member_casual)+scale_fill_discrete(name="Member Type")+
  theme(
    plot.title = element_text(size=14),
    strip.text = element_text(size=10,face="bold"),
    legend.position = "bottom"
  )


# Average ride duration (ride_length) by rideable type
ride_2023V2 %>% group_by(rideable_type) %>%
  summarise(avg_ride_length=mean(ride_length_minutes)) %>%
  ggplot(aes(x=rideable_type,y=avg_ride_length,fill = rideable_type))+ geom_col()+
  labs(x="Type of Rides",y="Average Ride Length",title = "Average Ride Duration by Ride Type")+
  theme_minimal()+scale_fill_discrete(name="Bike Type")


# Analyze the distribution of rides (ride_id) across different day_of_week
ride_2023V2 %>% group_by(day_of_week) %>% summarise(total_ride=n()) %>% 
  ggplot(aes(x=day_of_week,y=total_ride,fill = day_of_week))+geom_col()+
  labs(x="Week",y="Count of Rides",title = "Distribution of Rides Across Different Week")+
  scale_fill_discrete(name="Week") + theme(axis.text.x = element_text(angle=45,hjust=1))

# No of Rides by rideable types for each day of the week
ride_2023V2 %>% group_by(member_casual,rideable_type,day_of_week) %>% summarise(total_ride=n()) %>% 
  ggplot(aes(x=day_of_week,y=total_ride,fill = rideable_type))+geom_col(position = "dodge2")+
  facet_wrap(~ member_casual) +labs(x="Week",y="Count of Rides",title = " Rides by Rideable Types For Each Day of the Week")+
  theme(
    axis.text.x = element_text(angle = 45,hjust = 1),
    legend.position = "bottom"
    )
  

# Compare ride lengths (ride_length) between member_casual users
ride_2023V2 %>% group_by(member_casual) %>% 
  summarise(avg_ride_length=mean(ride_length_minutes),total = n()) %>% 
  mutate(avg_ride_length_rounded = round(avg_ride_length, 2)) %>% 
  ggplot(aes(x=member_casual,y=total,fill = factor(avg_ride_length_rounded)))+geom_col()+
  labs(x="Member Types",y="No of Rides",title="Average Ride Length and Number of Rides by Member Type ")+
  theme_minimal() + scale_fill_discrete(name="Average Ride Length")

# Month-wise maximum number of rides in a day along with the corresponding day
rides_per_day %>%
  group_by(month) %>%
  summarise(max_ride_in_a_day = max(num_rides), day = which.max(num_rides)) %>% 
  select(month, max_ride_in_a_day, day) %>% 
  ggplot(aes(x=month,y=max_ride_in_a_day,fill = factor(day)))+geom_col(position = "dodge2")+
           labs(x="Month",y="Maximum Ride in a Day",title = "Month-Wise Maximum no of Rides in a Day")+
           theme_minimal() +  scale_fill_discrete(name = "MonthDay")

# Most popular start and end station 
# Top 10 Popular Start station by member_casual(member)
ride_2023V2 %>% group_by(member_casual, start_station_name) %>% filter(member_casual=="member")%>% summarise(no_of_ride=n()) %>%
  arrange(desc(no_of_ride)) %>% top_n(10) %>% 
  ggplot(aes(x=start_station_name,y=no_of_ride,fill = member_casual))+geom_col(position = "dodge2")+
  coord_flip() +labs(x="Start Station Name",y="No of Rides",title="Top 10 Popular Start Station by Member")+
  theme_minimal() + scale_fill_discrete(name="Member Type")

# Top 10 Popular Start station by member_casual(casual)
ride_2023V2 %>% group_by(member_casual,start_station_name) %>% filter(member_casual=="casual") %>% 
  summarise(no_of_ride=n()) %>% arrange(desc(no_of_ride)) %>% top_n(10) %>% 
  ggplot(aes(x=start_station_name,y=no_of_ride,fill=member_casual))+geom_col(position = "dodge2")+coord_flip()+
  labs(x="Start Station Name",y="No of Rides",title = "Top 10 Popular Start Station by Member")+
  theme_minimal()+scale_fill_manual(name="Member Type",values = c("casual"="blue"))

# Top 10 Popular End station by member_casual(member)
ride_2023V2 %>% group_by(member_casual,end_station_name) %>% filter(member_casual=="member") %>% summarise(no_of_ride=n()) %>% 
  arrange(desc(no_of_ride)) %>% top_n(10) %>% 
  ggplot(aes(x=end_station_name,y=no_of_ride,fill=member_casual))+geom_col(position = "dodge2")+coord_flip()+
  labs(x="End Station Name",y="No of Rides",title = "Top 10 Popular End Station by Member")+
  theme_minimal()+scale_fill_discrete(name="Member Type")

# Top 10 Popular End station by member_casual(casual)
ride_2023V2 %>% group_by(member_casual,end_station_name) %>% filter(member_casual=="casual") %>% summarise(no_of_ride=n()) %>% 
  arrange(desc(no_of_ride)) %>% top_n(10) %>% 
  ggplot(aes(x=end_station_name,y=no_of_ride,fill = member_casual))+geom_col(position = "dodge2")+
  coord_flip()+labs(x="End Station Name",y="No of Rides",title = "Top 10 Popular End Station By Member")+
  theme_minimal()+scale_fill_manual(name="Member Type",values = c("casual"="blue"))

# Export combined df
install.packages("writexl")
library(writexl)

# Export
write.csv(ride_2023V2,"ride_2023_V2.csv",row.names = FALSE)
