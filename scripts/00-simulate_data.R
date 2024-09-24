#### Preamble ####
# Purpose: Simulates streetcar's delay data in Toronto
# Author: YITONG WANG
# Date: 29 September 2024
# Contact: stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(333)

# define possible location name
Location <- c("QUEENS QUAY AND HARBOU", "SPADINA AND QUEENS QUA", 
             "KIING AND BATHURST", "EGLINTON GARAGE", "COLLEGE AND OSSINGTON")

# define direction of streetcar
Bound <- c("E", "S", "W", "N")

# define start date and end date
start_d <- as.Date("2023-03-01")
end_d <- as.Date("2023-09-01")

# set number of observations
n <- 500

# simulate the data
simulated_data <- tibble(
  date = s_Date <- sample(seq(start_d, end_d, by = "day"), size = n, replace = TRUE),
  location = s_loca <- sample(Location, size = n, replace = TRUE),
  min_delay = s_min_delay <- sample(1:59, size = n, replace = TRUE),
  bound = s_bound <- sample(Bound, size = n, replace = TRUE))

# storage simulated data
write.csv(simulated_data, file = "streetcar_delay_analysis/data/raw_data/simulated_data.csv")
