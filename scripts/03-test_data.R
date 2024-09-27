#### Preamble ####
# Purpose: Tests simulated data and cleaned data
# Author: YITONG WANG
# Date: 29 September 2024
# Contact: stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Simulated data and cleaned data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(lubridate)

#### Read data
sim_data <- read_csv("Streetcar_delay_analysis/data/raw_data/simulated_data.csv")
# delete the first column contains unnecessary order number
sim_data <- sim_data %>% select(-1)
cle_data <- read_csv("Streetcar_delay_analysis/data/analysis_data/cleaned_data.csv")

#### Test simulated data ####
test_that("Data should not have N/A value", {
  expect_true(all(!is.na(sim_data$date)), info = "date should not have N/A values")
  expect_true(all(!is.na(sim_data$location)), info = "location should not have N/A values")
  expect_true(all(!is.na(sim_data$min_delay)), info = "min_delay should not have N/A values")
})

test_that("min_delay should be number and within 1 to 60(inclusisve) mins", {
  expect_type(sim_data$min_delay, "double")
  expect_true(all(sim_data$min_delay <= 60 & sim_data$min_delay > 0), info = "min_delay should within 1 hour")
})

test_that("Data has the correct structure", {
  expect_equal(ncol(sim_data), 7, info = "Data should have 7 columns")
  expect_equal(nrow(sim_data), 10000, info = "Data should have 10000 rows")
})


#### Test cleaned data ####
test_that("Data should not have N/A value", {
  expect_true(all(!is.na(cle_data$Date)), info = "Date should not have N/A values")
  expect_true(all(!is.na(cle_data$Location)), info = "Location should not have N/A values")
  expect_true(all(!is.na(cle_data$'Min Delay')), info = "Min_Delay should not have N/A values")
})

test_that("min_delay should be number and within 1 to 60(inclusisve) mins", {
  expect_type(cle_data$'Min Delay', "double")
  expect_true(all(cle_data$'Min Delay' <= 60 & cle_data$'Min Delay' > 0), info = "Min Delay should within 1 hour")
})

test_that("Data has the correct structure", {
  expect_equal(ncol(cle_data), 7, info = "Data should have 7 columns")
  expect_equal(nrow(cle_data), 10538, info = "Data should have 10538 rows")
})
