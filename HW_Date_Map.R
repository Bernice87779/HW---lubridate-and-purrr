# Homework: Date_Map(lubridate and purrr)

library(lubridate)
library(purrr)

# Question 1: Generate a sequence of dates from January 1, 2015 to December 31, 2025, spaced by every two months. Extract the year, quarter, and ISO week number for each date.
date_seq <- seq(ymd("2015-01-01"), ymd("2025-12-31"), by = "2 months")

date_info <- data.frame(
  Date = date_seq,
  Year = year(date_seq),
  Quarter = quarter(date_seq),
  ISO_Week = isoweek(date_seq)
)
date_info









