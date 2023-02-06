### Data Import ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, janitor, lubridate)

# Import and format data on Medicaid eligibility cutoffs
eligibility <- read_csv("Raw Data/eligibility.csv", 
                        col_names = c("Year", "Percent"), skip = 2)
eligibility$Year <- as.Date(as.character(eligibility$Year), format = "%Y")



# Import and format data on Americans foregoing medical care due to cost
forego <- read_csv("Raw Data/foregoing-care.csv", 
                   col_names = c("Abv", "Location", "Year", "Format", "Percent", "MOE"), skip = 6)
forego <- subset(forego, select = c("Year", "Percent"))
forego$Year <- as.Date(as.character(forego$Year), format = "%Y")



# Import and format data on ER visits per 1000 Americans
ervisits <- read_csv("Raw Data/er-visits.csv", 
                     col_names = c("Year", "Visits"), skip = 2)
ervisits$Year <- as.Date(as.character(ervisits$Year), format = "%Y")



# Import and format data on assets, in thousands, of lowest 20% of American earners
finances <- read_csv("Raw Data/finances.csv", 
                     col_names = c("Year", "Status", "Income", "Assets", "Debt"), skip = 5)
finances <- subset(finances, select = c("Year", "Assets", "Debt"))
finances$Year <- as.Date(as.character(finances$Year), format = "%Y")



# Import, truncate, and format data on health status survey data (lower value = better health)
hstatus <- read_csv("Raw Data/health-status.csv",
                    col_names = c("Year", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", 
                                  "2013", "2014", "2015", "2016", "2017", "2018", "2019"), skip = 5)
hstatus <- as.data.frame(t(hstatus[1:22, 1:16]))
hstatus <- hstatus |>  row_to_names(row_number = 1)
hstatus <- cbind(Year = rownames(hstatus), hstatus)
rownames(hstatus) <- 1:nrow(hstatus)
hstatus$Year <- as.Date(as.character(hstatus$Year), format = "%Y")
