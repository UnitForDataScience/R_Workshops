###########################################################################
######################### R Workshop Day 1 ################################
###########################################################################

# R Studio Intro

#_______________________ Comments________________________________________

# This is a comment
# not a comment #NOTE: This will cause error 

############################# The basics #################################

#_________________________Value assignment________________________________

a # Nothing assigned, will result in error
a <- 1
2 -> b
c = 3
a

#__________________________Simple math____________________________________

a + b
d <- a + b
d

e <- b*c
e
f <- e/b
f

#______________________________Logic_____________________________________

3 >= 2
4 < 4
4 == 4
a != b

h <- 3 >= 2

########################### Data structures ##############################

#______________________________Vector_____________________________________

g <- c(3, 4, 5, 6)
g
g[1]
g[2:4] # Retrieve all indexes between (& including) 2 and 4

#______________________________List_______________________________________

list.1 <- list(c(2,5,3),21.3,sin)
print(list.1)
list.1[1] # Returns a list object
list.1[[1]] # Returns the vector
list.1[[1]][1] # Returns the value

#____________________________Matrix_______________________________________

M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)
M[2,1] # Row, column

#____________________________Array________________________________________

A <- array(c('green','yellow', 'blue'),dim = c(3,3,2)) # Note: Case sensitivity
print(A)
A[2,3,2] # Dimension 1, dimension 2, dimension 3, ... and so on

#___________________________Factor_______________________________________

apple_colors <- c('green','green','yellow','red','red','red','green')
factor_apple <- factor(apple_colors) # Convert vector to factor
print(factor_apple)
print(nlevels(factor_apple)) # How many distict values
factor_apple[3] # Return value

#_________________________Data frame_____________________________________

BMI <- 	data.frame(
                    gender = c("Male", "Male","Female"), 
                    height = c(152, 171.5, 165), 
                    weight = c(81,93, 78),
                    Age = c(42,38,26)
                    )
print(BMI)
# Many ways to pull values from data frame
BMI[2]
BMI[[2]][3] # Similar to list

BMI[3,2] # Row, column

BMI['height'] # By column name
BMI[['height']][3] # Similar to list

BMI$height # Returns vector not list object
BMI$height[3]

BMI$Age #Autocomplete option

############################# Functions ##############################

#____________________What is a function?______________________________ 

print("Hello World")
# print(Hello World) # NOTE: This will not work 

sin(3)
mean(c(1, 2, 3, 4, 5, 5))

#____________________User defined functions___________________________

# Create a function to print k squared plus n 
new.function <- function(k, n) { # Can have as many arguments as you would like 
                                  m <- k^2 + n
                                        print(m)
                                } # Always close your functions 
                                  # unlike python, indents don't matter 
# Call the function new.function supplying 6 and c as an argument.

new.function(6, c)

############## Logical operations (IF statement) #####################

#______________Combining logic with functions_________________________

if(b < a){sum(c(a, b, c))} 

#_________________Nesting functions___________________________________

if(b < a){     # In R, whitespace is largely ignored
            cat("The total is equal to", sum(a, b,c))
          }

####################### Loops ########################################

#_____________________FOR loop________________________________________

for(i in 1:10){print(i)} 

#___________________WHILE loop_______________________________________

j = 0
while(j<10){
              j=j+1
              print(j)
              }

################### Combining loops and functions ###################

new.function.1 <- function(a) { # NOTE: Not the same "a" as above 
  for(i in 1:a) {
    b <- i^2
    print(b)
  } # Closing loop
} # Closing function

# Call the function new.function.1 supplying 6 as an argument.
new.function.1(6)

###################### Importing data ##############################

#______________Load the library into R workspace___________________
# Occupational Employment and Wage Statistics data below

library(readxl) # Essentially adds more functions you can use 
dataset <- read_excel("C:\\Users\\djlittle\\Desktop\\oesm20st (2)\\oesm20st\\state_M2020_dl.xlsx")
View(dataset)

#_________Will work if in same work directory (wd)________________

print(getwd())
dataset <- read_excel("state_M2020_dl.xlsx")
View(dataset)


# Learn more: 
#  https://www.tutorialspoint.com/r/index.htm


