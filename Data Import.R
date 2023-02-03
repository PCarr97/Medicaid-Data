### Data Import ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, janitor, lubridate)

eligibility <- read_csv("Raw Data/eligibility.csv", 
                        col_names = c("Year", "Percent"), skip = 2)
eligibility$Year <- as.Date(as.character(eligibility$Year), format = "%Y")

forego <- read_csv("Raw Data/foregoing-care.csv", 
                   col_names = c("Abv", "Location", "Year", "Format", "Percent", "MOE"), skip = 6)
forego <- subset(forego, select = c("Year", "Percent"))

ervisits <- read_csv("Raw Data/er-visits.csv", 
                     col_names = c("Year", "ER Visits Per Thousand"), skip = 2)

finances <- read_csv("Raw Data/finances.csv", 
                     col_names = c("Year", "Status", "Income", "Assets", "Debt"), skip = 4)
finances <- subset(finances, select = c("Year", "Assets", "Debt"))

hstatus <- read_csv("Raw Data/health-status.csv",
                    col_names = c("Year", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", 
                                  "2013", "2014", "2015", "2016", "2017", "2018", "2019"),
                    skip = 5)

hstatus <- (t(hstatus[1:22, 1:16]))
hstatus <- hstatus |>  row_to_names(row_number = 1)
hstatus <- cbind(Year = rownames(hstatus), hstatus)
rownames(hstatus) <- 1:nrow(hstatus)
