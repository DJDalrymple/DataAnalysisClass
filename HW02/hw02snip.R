library(readxl)
library(tidyverse)


unemp <- read_excel("SeriesReport-20170125193553_b114a0.xlsx", skip=10, col_names=TRUE)
unemp <- mutate(unemp, Year=as.Date(sprintf("%d-01-01", as.integer(Year))))

glimpse(unemp)

ggplot(unemp, aes(Year, Annual)) +
  geom_line(aes(group=1)) +
  stat_smooth(method = lm)
  scale_x_date(date_breaks="10 years", date_labels="%Y") 

## Is the current *national* unemployment rate going up, down or holding steady"?  
#The graph of the national unemployment rate shows the trend is heading upwards 
##  from just under 5% in 1947 to almost 7% in 2016.

  bls <- read_excel("staadata.xlsx")
  bls <- bls[8:nrow(bls),c(2,3,10)]
  colnames(bls)<- c("State","Year", "Rate")
  bls$Rate <- as.numeric(bls$Rate)
  
  bls15 <- filter(bls, Year == "2015")
  bls15[order(bls15$Rate),] %>%
    head()
  
  bls08 <- filter(bls, Year == "2008")
  bls08[order(bls08$Rate),] %>%
    head()

  
# - Which state(s) — could be ties — have the lowest (most current) unemployment rate?
#  for 2015, North Dakota had the lowest unemployment rate of 2.7%
  
#  - Which states(s) — could be ties — had the lowest unemployment unemployment rate in 2008?  
#  for 2008, South Dakota and Wyoming tied for the lowest unemployment rate with 3.1% each.

  

##by Decade
lut <- c("1" = "1976-1985", "2" = "1986-1995", "3" ="1996-2005", "4" = "2006-2015" )  

bls10 <- mutate(bls,Decade=as.character(ntile(Year,4)))
bls10$Decade <- lut[bls10$Decade]

NJbls10 <- filter(bls10, State == "New Jersey")%>%
    group_by(Decade)%>%
    summarise(mean(Rate))
NJbls10


WYbls10 <- filter(bls10, State == "Wyoming")%>%
  group_by(Decade)%>%
  summarise(mean(Rate)) 

NJWYbls10 <- filter(bls10, State == "New Jersey"|State == "Wyoming")%>%
  group_by(Decade, State)%>%
  summarise(Mean = mean(Rate))

spread(NJWYbls10, State, Mean)%>%
  mutate(Difference =  `New Jersey`- Wyoming )

## What was the mean unemployment rate for New Jersey by complete decade?

## show the NJbls10 with the rates by year

## How does the mean unemployment rate for New Jersey by complete decade 
##compare to the mean unemployment rate by complete decade for for Wyoming?
## show the NJWYbls10 with the rates by year and difference
## With the exception of the decade of 1986-1995, the mean unemloyment rate of Wyoming
## was lower than the unemployment rate of NJ
