#Importing Data Set
library(readr)
twitch_streamers <- read.csv("Most Popular Twitch Streamers.csv")
setwd(temp)
View(twitch_streamers)

library(gapminder)
library(tidyverse)
library(socviz)

#Model 1
p <- ggplot(data=twitch_streamers,
            mapping = aes(x= Date, y= Viewers))
p + geom_point()

p + geom_line(mapping = 
                aes(group = Streamer))     

p <- ggplot(data = twitch_streamers,
            mapping = aes(x = Date, y = Viewers))


#Model #2
twitch_streamers %>% select(1:3) 
p <- ggplot(data=twitch_streamers,
            mapping = aes(x= Date, y= Viewers))
p + geom_point()

p + geom_line(mapping = 
                aes(group = Streamer))    

p <- ggplot(data = twitch_streamers,
            mapping = aes(x = Date, y = Viewers))
p + geom_line(aes(group = Streamer)) + 
  facet_wrap(~ Streamer)  

