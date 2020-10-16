#Zach Stimmel

#importing a data set
library(readr)
covid_info <- read_csv("data.csv")
View(covid_info)

library(gapminder)
library(tidyverse)
library(socviz)

#organizing data
Group7 <- c("Canada", "France", "Germany", "Italy", "Japan", 
             "United_States_of_America", "United Kingdom")
Group7_countries <- covid_info [covid_info$countriesAndTerritories %in% Group7,]
#Creating graph
p <- ggplot(data = Group7_countries ,
            mapping = aes(x=day, y= cases, color=countriesAndTerritories))
p + geom_line() +
labs(title = "Group 7 Covid-19 Case Counts", x = "", y= "New Cases per Day",
     subtitle = "by Zach Stimmel as of 2020-10-16",
     caption= "Data:ECDC Times") +
  scale_x_continuous(labels = c("Jan", "Apr", "Jul", "Oct"))