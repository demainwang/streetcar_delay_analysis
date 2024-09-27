#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: YITONG WANG
# Date: 29 September 2024
# Contact: stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
#delete any row contains N/A value or 0 delay time
raw_data <- read_csv("streetcar_delay_analysis/data/raw_data/2023_streetcar.csv")
sum(is.na(data))
data1 <- raw_data %>% mutate(`Min Delay` = as.numeric(trimws(`Min Delay`)))
data1 <- na.omit(data1)

#delete outlier data
sum(data1$`Min Delay` < 61)
sum(data1$`Min Delay` > 60)
data3 <- data1 %>% filter(`Min Delay` > 0 & `Min Delay` < 61)
cleaned_data <- data3 %>% select(Date, Day, Time, Location, Incident, `Min Delay`, Bound)
cleaned_data <- cleaned_data %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))

#### Save data ####
write_csv(cleaned_data, "streetcar_delay_analysis/data/analysis_data/cleaned_data.csv")
