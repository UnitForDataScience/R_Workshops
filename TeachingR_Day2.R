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

#______________ Tidy Introduction __________________________________

# What is a Tibble?

library(tidyverse)
dataset <- as_tibble(dataset)

#______________ Pipes ____________________________________________

dataset %>% 
  summary()

dataset %>% 
  drop_na() %>% 
  summary() #Note that this is now an empty set 

#______________ Selecting Columns ____________________________________________

subset <- dataset %>% select(-PCT_TOTAL, -ANNUAL, -HOURLY) #Remove some highly NULL columns

subset %>% 
  drop_na() %>% 
  summary()
subset %>% view() 

#______________ Filtering ____________________________________________

subset %>% filter(H_MEDIAN>50 & TOT_EMP < 1100) %>%  
  summary()

#______________ Sorting ____________________________________________

subset %>% arrange(TOT_EMP) # Ascending sort
subset %>% arrange(-TOT_EMP) # Decending sort 

#______________ Mutate ____________________________________________

sub2 <- subset %>% mutate(logTOT_EMP = log2(TOT_EMP)) # VERY powerful tool
  
#______________ Renaming Columns ___________________________________

sub3 <- sub2 %>% rename(log.TOT.EMP = logTOT_EMP) # Reverse from what you think 

#______________ Changing Values _____________________________________

sub4 <- sub3 %>% 
  mutate(TOT_EMP = replace(TOT_EMP, TOT_EMP < 100 | TOT_EMP >1000000, NA))


# Learn more: 
#  https://www.tutorialspoint.com/r/index.htm