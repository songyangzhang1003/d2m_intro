#install.packages("tidyverse")
library(tidyverse)
#install.packages("papaja")
library(papaja)
library(ggplot2)

number <- 1
string <- "abc"

df <- data.frame(
  numm = 100)

#Assginment 4 
hello_world <- function(name, is_morning){
  #object assignment 
  greeting <- ""
  #determine greeting based on whether it is morning and name 
  if (is_morning == TRUE && name == "Dr. Dowling") {
    greeting <- ("Good morning, Dr. Dowling!")
  } else if (is_morning == FALSE && name == "Dr. Dowling") {
    greeting <- ("Hello Dr. Dowling!")
  } else if (is_morning == TRUE && name == "Yvette") {
    greeting <- ("Sup Yvette")
  } else {
    greeting <- ("hello there")
  }
  return(greeting)
}
  

#class practice on class repo, for convenience I downloaded here 
data <- read_excel("MM Data.xlsx", sheet=1, skip=1)
data 



