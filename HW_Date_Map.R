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

# Question 2: Given the following dates, compute the difference in months and weeks between each consecutive pair.
sample_dates <- ymd(c("2018-03-15", "2020-07-20", "2023-01-10", "2025-09-05"))
map2(sample_dates[-length(sample_dates)], sample_dates[-1], ~ {
  list(
    Month_Diff = interval(.x, .y) %/% months(1),
    Week_Diff = interval(.x, .y) %/% weeks(1)
  )
})

# Question 3: Using map() and map_dbl(), compute the mean, median, and standard deviation for each numeric vector in the following list:
num_lists <- list(c(4, 16, 25, 36, 49), c(2.3, 5.7, 8.1, 11.4), c(10, 20, 30, 40, 50))

list(
  Mean = paste(map_dbl(num_lists, mean), collapse = ", "),
  Median = paste(map_dbl(num_lists, median), collapse = ", "),
  SD = paste(map_dbl(num_lists, sd), collapse = ", ")
)

# Question 4: Given a list of mixed date formats, use map() and possibly() from purrr to safely convert them to Date format and extract the month name.
Sys.setlocale("LC_TIME", "C")
date_strings <- list("2023-06-10", "2022/12/25", "15-Aug-2021", "InvalidDate")
safe_parse_date <- possibly(~ as.Date(.x, tryFormats = c("%Y-%m-%d", "%Y/%m/%d", "%d-%b-%Y")), NA)
converted_dates <- map(date_strings, safe_parse_date)
map_chr(converted_dates, ~ if (!is.na(.x)) as.character(month(.x, label = TRUE, locale = "en_US")) else "Invalid")







