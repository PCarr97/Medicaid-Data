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
  ylim(0, 0.17) +
  xlab("Year") +
  ylab("% Foregoing") +
  ggtitle("Percentage Foregoing Medical Care Due to Cost") +
  geom_vline(aes(xintercept = as.Date(Year[9])), linetype = 4, size = 1.75, color = "red")



# ER Visits plot
ervisits |> ggplot() +
  geom_line(aes(x = Year, y = Visits), size = 1.5, color = 'red2') +
  ylim(0, 450) +
  xlab("Year") + 
  ylab("Number of ER Visits") +
  ggtitle("Emergency Room Visits per Thousand Americans")



#Finances plot
finances |> ggplot(aes(x = Year)) +
  geom_point(aes(y = Debt, color = 'red'), size = 2.5) +
  geom_point(aes(y = Assets, color = "blue"), size = 2.5) +
  xlab("Year") + 
  ylab("Amount in Thousands") +
  ggtitle("Debts and Assets of Lowest 20% of American Earners") +
  scale_color_identity(name = '',
                       breaks = c('blue', 'red'),
                       labels = c("Assets", "Debt"),
                       guide = 'legend')




# Eligibility vs. Percentage foregoing care #
ggplot() +
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  scale_x_date(limits = as.Date(c("2005-01-01","2021-01-01"))) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")





