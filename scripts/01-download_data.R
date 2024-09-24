#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: YITONG WANG
# Date: 29 September 2024
# Contact: stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# get package
package <- show_package("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
package

# get all resources for this package
resources <- list_package_resources("b68cb71b-44a7-4394-97e2-5d2f41462a5d")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) == 'xlsx')

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==12) %>% get_resource()
data


#### Save data ####
write_csv(data, "streetcar_delay_analysis/data/raw_data/2023_streetcar.csv") 

         
