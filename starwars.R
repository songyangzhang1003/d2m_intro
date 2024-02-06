library(tidyverse)

## Create your goal tibble to replicate

# Run this line to see what your end product should look like
sw.wrangled.goal <- read_csv("sw-wrangled.csv") %>% 
  mutate(across(c(hair, gender, species, homeworld), factor)) # this is a quick-and-dirty fix to account for odd importing behavior

# View in console
sw.wrangled.goal 

# Examine the structure of the df and take note of data types
# Look closely at factors (you may need another function to do so) to see their levels
str(sw.wrangled.goal) 



## Use the built-in starwars dataset to replicate the tibble above in a tbl called sw.wrangled
# If you get stuck, use comments to "hold space" for where you know code needs to go to achieve a goal you're not sure how to execute
####assignment 8
head(starwars)
sw_wrangled <- starwars %>%
  mutate(first_name = word(name, 1),  
         last_name = word(name, 2),   
         initials = paste0(substr(first_name, 1, 1), substr(last_name, 1, 1)),
         height_in = height / 2.54,  
         gender = substr(gender, 1, 1), 
         brown_hair = ifelse(hair_color == "brown", TRUE, FALSE)) %>%
  select(first_name, last_name, initials, height_in, height, mass, hair_color, gender, species, homeworld, brown_hair)

sw_wrangled


## Check that your sw.wrangled df is identical to the goal df
# Use any returned information about mismatches to adjust your code as needed
all.equal(sw.wrangled.goal, sw.wrangled.goal)

#Assignment 11 
library(ggplot2)
plot1 <- ggplot(data=sw_wrangled, aes(x=height)) + 
  geom_histogram(binwidth=10, fill="darkgrey", color="darkgrey")+ 
  NULL 
plot1

#In creating plot2, i try to use the reorder function to make the bar plot in 
#descending order, however it does not seem to work. In the graph below, it is 
#not in descending order. 
plot2 <- ggplot(data = sw_wrangled, aes(x = hair_color)) +
  geom_bar() + 
  NULL 
plot2


sw_wrangled1 <- sw_wrangled %>%
  filter(mass < 1000)
plot3 <- ggplot(data = sw_wrangled1, aes(x = height_in, y=mass)) +
  geom_point(shape = 24, fill="black", size=1) + 
  NULL 
plot3


#Assignment 12 
plot4 <- ggplot(sw_wrangled1, aes(x = hair_color, y = mass, fill = hair_color)) + 
  geom_boxplot() + 
  labs(x = "Hair color(s)", y = "Mass (kg)", title = "Distribution of Mass Across Hair Colors") +
  NULL
plot4

#I am not sure why in this plot the na.rm function does not work in removing the NA function 
plot5 <- ggplot(sw_wrangled, aes(x = mass, y = height_in)) + 
  geom_point() + 
  geom_smooth(method = lm) + 
  facet_wrap(~brown_hair, na.rm = TRUE, labeller = labeller(brown_hair = c(`TRUE` = "Has brown hair", `FALSE` = "No brown hair"))) + 
  labs(x = "Mass", y = "Height in") +
  NULL
plot5

#I am not sure as well why within this function na.rm does not work... 
#should I clean the dataset before the plot, or there is something that I can do 
#within ggplot to remove missing value? 
plot6 <- ggplot(sw_wrangled, aes(x = substr(first_name, 1, 1), fill = gender, na.rm=TRUE)) + 
  geom_bar() + 
  coord_flip() + 
  labs(x = "Species first letter", y = "Count") +
  NULL
plot6
