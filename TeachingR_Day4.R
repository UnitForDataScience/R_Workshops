###########################################################################
######################### R Workshop Day 4 ################################
###########################################################################

###################### Importing data ##############################

#______________Load the library into R workspace___________________
# Occupational Employment and Wage Statistics data below

library(readxl) # Essentially adds more functions you can use 
dataset <- read_excel("C:\\Users\\djlittle\\Documents\\oesm20st\\state_M2020_dl.xlsx",
                      col_types = c("text","text","text","text","text","text",
                                    "text","text","text","text","text","numeric",
                                    "numeric","numeric","numeric","logical","numeric"
                                    ,"numeric","numeric","numeric","numeric","numeric"
                                    ,"numeric","numeric","numeric","numeric","numeric"
                                    ,"numeric","numeric","logical", "logical")) 
View(dataset)

summary(dataset)


###################### NULL Values ##############################

# What is a NULL value?
  # Why do we care?

#______________ Drop NA ___________________
library(tidyverse)

no_NAs <- dataset %>% 
               drop_na() 

no_NAs_sub <- dataset %>% 
            select(-PCT_TOTAL, -ANNUAL, -HOURLY) %>% 
            drop_na() 

#______________ Fill NA ___________________

# Value (year) is recorded only when it changes
sales <- tibble::tribble(
  ~quarter, ~year, ~sales,
  "Q1",    2000,    66013,
  "Q2",      NA,    69182,
  "Q3",      NA,    53175,
  "Q4",      NA,    21001,
  "Q1",    2001,    46036,
  "Q2",      NA,    58842,
  "Q3",      NA,    44568,
  "Q4",      NA,    50197,
  "Q1",    2002,    39113,
  "Q2",      NA,    41668,
  "Q3",      NA,    30144,
  "Q4",      NA,    52897,
  "Q1",    2004,    32129,
  "Q2",      NA,    67686,
  "Q3",      NA,    31768,
  "Q4",      NA,    49094
)
view(sales)


# `fill()` defaults to replacing missing data from top to bottom
no_NA_sales <- sales %>% fill(-year)
view(no_NA_sales)

#______________ Replace NA ___________________

hmean.mean = mean(dataset$H_MEAN, na.rm = TRUE)

no_NAs_replace <- dataset %>% 
  replace_na(list(H_MEAN=hmean.mean, A_MEAN=0)) 
view(no_NAs_replace)



#______________ Replace NA - Another approach ___________________

mean(dataset$H_MEAN, na.rm = TRUE)
median(dataset$H_MEDIAN, na.rm = TRUE)

dataset$H_MEAN[is.na(dataset$H_MEAN)] <- mean(dataset$H_MEAN, na.rm = TRUE)
dataset$H_MEDIAN[is.na(dataset$H_MEDIAN)] <- median(dataset$H_MEDIAN, na.rm = TRUE)


# Learn more: 
# https://www.r-bloggers.com/2021/04/handling-missing-values-in-r/

#________________________ Other data types ____________________________________
x1 <- NA
x2 <- NaN #Not a number
x3 <- NULL # Different from NA & NaN

is.na(x1)
is.na(x2)
is.na(x3)

is.nan(x1)
is.nan(x2)
is.nan(x3)

is.null(x1)
is.null(x2)
is.null(x3)

y1 <- Inf
y2 <- -Inf
is.infinite(y1)
is.infinite(y2)

###################### JOINING Tables ##############################

band_members
band_instruments

# "Mutating" joins combine variables from the LHS and RHS
band_members %>% inner_join(band_instruments)
band_members %>% left_join(band_instruments)
band_members %>% right_join(band_instruments)

band_members %>% full_join(band_instruments)

# "Filtering" joins keep cases from the LHS
band_members %>% semi_join(band_instruments)

band_members %>% anti_join(band_instruments) # Inverse filtering

# To suppress the message, supply by (Or to join by different columns)
# To join by different variables on x and y use a named vector. 
#  For example, by = c("a" = "b") will match x.a to y.b.
band_members %>% inner_join(band_instruments, by = "name")

band_instruments2
# Use a named `by` if the join variables have different names
band_members %>% full_join(band_instruments2, by = c("name" = "artist"))

band_members %>% full_join(band_instruments2)

# Learn more: 
# https://dplyr.tidyverse.org/reference/join.html

