### Data Visualizations ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, dplyr, ggplot2)

# Eligibility plot
eligibility |> 
  ggplot() +
  geom_point(aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  ylim(0, 1.4) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trend")



# Forego plot
forego |> ggplot() +
  geom_line(aes(x = Year, y = Percent), size = 1.5, color = "darkgreen") +
  geom_vline(aes(xintercept = as.Date(Year[9])), linetype = 4, size = 1.75, color = "red") +
  ylim(0, 0.17) +
  xlab("Year") +
  ylab("% Foregoing") +
  ggtitle("Percentage Foregoing Medical Care Due to Cost")




# ER Visits plot
ervisits |> ggplot() +
  geom_line(aes(x = Year, y = Visits), size = 1.5, color = 'red2') +
  ylim(200, 450) +
  xlab("Year") + 
  ylab("Number of ER Visits") +
  ggtitle("Emergency Room Visits per Thousand Americans")



#Finances plot
finances |> ggplot(aes(x = Year)) +
  geom_point(aes(y = Debt, color = 'red'), size = 2.5) +
  geom_point(aes(y = Assets, color = "blue"), size = 2.5) +
  geom_vline(aes(xintercept = as.Date(Year[5])), linetype = 4, size = 1.75, color = "darkgreen") +
  xlab("Year") + 
  ylab("Amount in Thousands") +
  ggtitle("Debts and Assets of Lowest 20% of American Earners") +
  scale_color_identity(name = '',
                       breaks = c('blue', 'red'),
                       labels = c("Assets", "Debt"),
                       guide = 'legend')



#Health Status of Male v Female example plot
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = White, color = 'blue4'), size = 1.5) +
  geom_line(aes(y = Black, color = 'darkgreen'), size = 1.5) +
  scale_color_identity(name = '',
                       breaks = c('blue4', 'darkgreen'),
                       labels = c("White", "Black"),
                       guide = 'legend')



#Health status of those under poverty line
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct, color = 'red'), size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9]), color = "blue"), linetype = 4, size = 1.75)




#############################################################################################################
# Example of combining two data sets #
ggplot() +
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  scale_x_date(limits = as.Date(c("2005-01-01","2021-01-01"))) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")





