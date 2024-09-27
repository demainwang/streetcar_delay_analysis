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
library(hms)

#### Simulate data ####
set.seed(333)

# define possible location name
streetcar_data <- read_csv("streetcar_delay_analysis/data/raw_data/2023_streetcar.csv")
all_locations <- unique(streetcar_data$Location)

# define possible delay_causing incidents
streetcar_data <- read_csv("streetcar_delay_analysis/data/raw_data/2023_streetcar.csv")
all_incidents <- unique(streetcar_data$Incident)

# define possible day
streetcar_data <- read_csv("streetcar_delay_analysis/data/raw_data/2023_streetcar.csv")
all_day <- unique(streetcar_data$Day)

# define time
times <- seq(from = as.POSIXct("05:00:00", format = "%H:%M:%S"), 
                    to = as.POSIXct("23:59:59", format = "%H:%M:%S"), by = "min")
times <- hms::as_hms(format(times, "%H:%M:%S"))

# define direction of streetcar
Bound <- c("E", "S", "W", "N")

# define start date and end date
start_d <- as.Date("2023-03-01")
end_d <- as.Date("2023-09-01")

# set number of observations
n <- 10000

# simulate the data
simulated_data <- data.frame(
  date = s_date <- sample(seq(start_d, end_d, by = "day"), size = n, replace = TRUE),
  day = s_day <- sample(all_day, size = n, replace = TRUE),
  time = s_time <- sample(times, size = n, replace = TRUE),
  location = s_loca <- sample(all_locations, size = n, replace = TRUE),
  incident = s_incident <- sample(all_incidents, size = n, replace = TRUE),
  min_delay = s_min_delay <- sample(1:60, size = n, replace = TRUE),
  bound = s_bound <- sample(Bound, size = n, replace = TRUE))

# storage simulated data
write.csv(simulated_data, file = "streetcar_delay_analysis/data/raw_data/simulated_data.csv")
