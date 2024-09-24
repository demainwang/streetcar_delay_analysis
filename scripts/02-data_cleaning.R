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
data3 <- data1 %>% filter(`Min Delay` > 0 & `Min Delay` < 60)
cleaned_data <- data3 %>% select(Day, Location, `Min Delay`, Bound)


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
