#Assignment 2.R Script
#getwd
Temp <- getwd()

# Switching the working directory to the covid-19-data subfolder
setwd("~/")
setwd("~/covid-19-data/")


#Import File into R studio
library(readr)
us_states <- read_csv("covid-19-data/us-states.csv")
setwd(Temp)
View(us_states)
#Processing for only observations from PA
library(dplyr)
select(us_states, column="state") 
Df <- filter(us_states, state == "Pennsylvania" )
#New Variable adj_deaths
n <- length(Df$date)
Df$adj_deaths <- 0
for (i in 1:n) {
  if (as.character(Df$date[i])=="2020-04-21") {
    Df$adj_deaths[i] <- (Df$deaths[i]-282)
  }
  else {if (as.character(Df$date[i])=="2020-04-22") {
    Df$adj_deaths[i] <- (Df$deaths[i]-297)
  }
    else {Df$adj_deaths[i] <- Df$deaths[i]}}
}
#Sum
sum(Df$adj_deaths)


