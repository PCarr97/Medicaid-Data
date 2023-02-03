### Data Import ###
install.packages('pacman')
library(pacman)
p_load(tidyverse)

eligibility <- read_csv("Raw Data/eligibility.csv", 
                        col_names = c("Date", "Percent of Poverty Line"), skip = 2)
forego <- read_csv("Raw Data/foregoing-care.csv", 
                   col_names = c("Abv", "Location", "Year", "Format", "Percent", "MOE"), skip = 6)
ervisits <- read_csv("Raw Data/er-visits.csv", 
                     col_names = c("Date", "ER Visits Per Thousand"), skip = 2)
finances <- read_csv("Raw Data/finances.csv", 
                     skip = 4)
