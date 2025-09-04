# load the library to read the excel
library(readxl)
library(tidyverse)

# read the excel on sheet 2 and name the data frame as sites
sites <- read_xlsx(sheet = 2,"data/sttstj_all_sites.xlsx")

# opens sites data to look at
View(sites)

# 1. Import sttstj_all_sites and inspect the data set. What is the data structure and the data type of each field?

#check the data structure
glimpse(sites)

# This data set has 2,505 rows and 5 columns. The year_site and habitat columns are characters and lat, long and year columns are integers (numbers). 

# 2. How many samples are in the data set?

# tells you number of rows/samples
nrow(sites)

# There are 2,505 samples in the data set.

# 3. How many unique habitat types are there? What are the names of each habitat?

# use function unique to filter the data frame sites and the column habitat
unique(sites$hab)

# There are 6 unique habitats named "PVMT" "AGRF" "SCR"  "PTRF" "BDRK" "HARD".

# 4. How many sites are there in the “PVMT” habitat type?

#take the data frame sites then filter for PVMT in the column habitat then count number of rows
sites%>%filter(hab == "PVMT")%>% nrow()

# There are 571 sites in the PVMT habitat type.

# 5. How many sites are there in the “PVMT” or “AGRF” habitat types?

#take the data frame sites then filter for PVMT in the column habitat use the line (|) with means or and then do habitat for the AGRF then count number of rows
sites%>%filter(hab == "PVMT"| hab == "AGRF")%>% nrow() 

# There are 1,538 sites in both the PVMT or AGRF habitat types.

# 6. How many sites are there in all the habitat types EXCEPT “PVMT”?

# change == which means equal to to != with is not equal to
sites%>%filter(hab!="PVMT")%>% nrow() 

# There are 1934 sites in the habitat types except PVMT.

# 7. Show the first 5 records (rows) of… all sites sampled in “AGRF” or “SCR” only show the “yr_site” and “hab” columns

# this shows first 5 with AGRF and SCR
sites%>%filter(hab =="AGRF" | hab== "SCR") %>% head()

# this will now only show yr_site and hab columns
sites%>%filter(hab =="AGRF" | hab== "SCR") %>% head() %>% select(yr_site,hab)
  
# 8. What is the northern most site sampled in the “BDRK” habitat?

# take data frame site, filter for  BDK in hab column. then arrange the latitude column in a decending order
sites%>%filter(hab == "BDRK")%>%arrange(desc(lat))

# the northernmost site was 2019_5450

# 9. What is the western most site sampled in either “AGRF” or “PTRF” habitat?

sites%>%filter(hab == "AGRF" | hab =="PTRF")%>%arrange(lon)

# The westernmost habitat is AGRF at site 2015_9758.

# 10. How many years were surveyed in the data set?

unique(sites$year)

# 16 years were surveyed in the data set. 

# 11. What is the eastern most site sample in the “AGRF” habitat in 2004?

sites %>% filter(hab == "AGRF" & year == "2004") %>% arrange(desc(lon))

# The easternmost site sampled in the AGRF habitat was 2004_1821. 