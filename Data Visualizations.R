### Data Visualizations ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, dplyr, ggplot2)

eligibility |> 
  ggplot() +
  geom_point(aes(x = Year, y = Percent), size = 3, color = "blue") +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")

ggplot() +
  filter(eligibility$Year > 2005) |> 
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  #scale_y_continuous(sec_axis(trans = ~., name = "Assets")) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")



eligibility |> ggplot() +
  geom_smooth(aes(x = Year, y = Percent))

ervisits |> ggplot() +
  geom_point(aes(x = Year, y = Visits))

forego |> ggplot() +
  geom_point(aes(x = Year, y = Percent))

finances |> ggplot() +
  geom_point(aes(x = Year, y = Debt), size = 2, color = "red") +
  geom_point(aes(x = Year, y = Assets), size = 2, color = "blue")
