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


#___________________ Grouping _____________________________________


library(tidyverse)

state.summary <- dataset %>% 
  group_by(AREA_TITLE) %>% 
  summarize(mean = mean(TOT_EMP, na.rm = TRUE), 
            std_dev = sd(TOT_EMP, na.rm = TRUE))
state.summary

occ.summary <- dataset %>% 
  group_by(OCC_TITLE) %>% 
  summarize(mean = mean(TOT_EMP, na.rm = TRUE), 
            std_dev = sd(TOT_EMP, na.rm = TRUE))
occ.summary


#___________________ Spread _____________________________________

subset <- dataset %>% select(c(AREA_TITLE,OCC_TITLE,TOT_EMP))

state.spread <- subset %>%
  spread(key = AREA_TITLE, value = TOT_EMP)
state.spread

occ.spread <- subset %>%
  spread(key = OCC_TITLE, value = TOT_EMP)
occ.spread

# __________________ Gather ______________________________________


subset2 <- dataset %>% select(c(AREA_TITLE,OCC_TITLE,TOT_EMP,H_MEAN, A_MEAN, H_MEDIAN, A_MEDIAN))

Gathered<- subset2 %>% gather(key = "Stat", value = "Value", 3:7) %>% arrange(OCC_TITLE)


# Learn more: 
#  https://www.tutorialspoint.com/r/index.htm
