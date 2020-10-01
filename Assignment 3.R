#getwd
Temp <- getwd()

# Switching the working directory to the covid-19-data subfolder
setwd("~/")
setwd("~/covid-19-data/")


#Import File into R studio
library(readr)
us_counties <- read_csv("covid-19-data/us-counties.csv")
setwd(Temp)
View(us_counties)

#Pulling out Lehigh County info
LEHIGH <- filter(us_counties, state== "Pennsylvania" 
                 & county== "Lehigh")
View(LEHIGH)

n <- length(LEHIGH$date)
LEHIGH$incr_cases <- 1
View(LEHIGH)

for (i in 2:n) {
  LEHIGH$incr_cases[i] <- (LEHIGH$cases[i]-LEHIGH$cases[i-1])
}
View(LEHIGH)
#plot
p <- ggplot(data = LEHIGH,
            mapping = aes(x=date,
                          y=incr_cases))
p + geom_point() +
  labs(x="Dates", y="Incremental Cases",
       title= "COVID-19 Cases in Lehigh County, PA",
       subtitle= "Points are incremental new confirmed cases",
       caption= "Source: NY Times")
#Assignment 3 complete
