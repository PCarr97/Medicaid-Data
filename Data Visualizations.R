### Data Visualizations ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, dplyr, ggplot2)

# Eligibility plot
eligibility |> 
  ggplot() +
  geom_point(aes(x = Year, y = Percent), size = 3, color = "blue") +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")

# Forego plot
forego |> ggplot() +
  geom_line(aes(x = Year, y = Percent), size = 1.5, color = "darkgreen")

# Eligibility vs. Percentage foregoing care #
ggplot() +
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  scale_x_date(limits = as.Date(c("2005-01-01","2021-01-01"))) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends") + 
  labs()




eligibility |> ggplot() +
  geom_smooth(aes(x = Year, y = Percent))

ervisits |> ggplot() +
  geom_point(aes(x = Year, y = Visits))



finances |> ggplot() +
  geom_point(aes(x = Year, y = Debt), size = 2, color = "red") +
  geom_point(aes(x = Year, y = Assets), size = 2, color = "blue")
