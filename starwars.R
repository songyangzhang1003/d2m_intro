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
