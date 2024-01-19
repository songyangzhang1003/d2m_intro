#in the mock-up dataset, I delected several variables that I did not plan to
#use in the dataset 
#first, qualtrics have time & click measures, this is not relevant to my analysis 
#second, I deleted mediator (attitude toward the intervention, and general
#attitude towards vaccination) because for the first set of analysis we don't 
#plan to look at any possible mediators 
#third, I delete the free response question answers. In the current analysis, 
#I am not planning to do quantitative text analysis such as NLP in R 
#Fourth, after deleting several variables, I am planning to group the dataset 
#into four conditions based on my experiment..But for convenience for further
#regression analysis, I am not planning to do pivot_wider 

#below is a set of code based on my mock data 
#for convenience, I can delete the full column of certain variables that 
#i am not planning to use in my analysis, or I can keep it in my 
#data file since it is also not influencing my regression model with covariates
#here I only select the eligible participant based on their age, 
#attention check questions 

raw <- read.csv(file = "HPVMaleVaccine_Data_Study1.csv")
data <- subset(raw, Finished==1 & Duration..in.seconds. > 0 &
                 attention_check_1==5 & honest_check==1 & age < 27)
raw_finished <-subset(raw, Finished==1 & Duration..in.seconds. > 0 & 
                        consent_agree ==1 & income > 0)
raw_finished$Exclusion <- ifelse(raw_finished$Finished!=1|raw_finished$Duration..in.seconds.==0|
                                   raw_finished$attention_check_1!=5|raw_finished$honest_check!=1|
                                   raw_finished$age>=27,1,0)
table(raw_finished$attention_check_1)
table(raw_finished$honest_check)