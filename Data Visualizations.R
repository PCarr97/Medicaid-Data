### Data Visualizations ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, dplyr, ggplot2)

# Eligibility plot
eligibility |> 
  ggplot() +
  geom_point(aes(x = Year, y = Percent), size = 2.5, color = "#1d65a0") +
  ylim(0, 1.4) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trend") +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))



# Forego plot
forego |> ggplot() +
  geom_line(aes(x = Year, y = Percent), size = 1.5, color = "#f19633") +
  geom_vline(aes(xintercept = as.Date(Year[9])), linetype = 'twodash', size = 1.5, color = "#1d65a0") +
  ylim(0, 0.17) +
  xlab("Year") +
  ylab("% Foregoing") +
  ggtitle("Percentage Foregoing Medical Care Due to Cost") +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))




# ER Visits plot
ervisits |> ggplot() +
  geom_line(aes(x = Year, y = Visits), size = 1.5, color = '#7d0540') +
  geom_vline(aes(xintercept = as.Date(Year[9])), linetype = 'twodash', size = 1.5, color = "#1d65a0") +
  ylim(200, 450) +
  xlab("Year") + 
  ylab("Number of ER Visits") +
  ggtitle("Emergency Room Visits per Thousand Americans") +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))




#Finances plot
finances |> ggplot(aes(x = Year)) +
  geom_point(aes(y = Debt, color = '#fc5c88'), size = 2.75) +
  geom_point(aes(y = Assets, color = "black"), size = 2.75) +
  geom_vline(aes(xintercept = as.Date(Year[5])), linetype = 'twodash', size = 1.5, color = "#1d65a0") +
  xlab("Year") + 
  ylab("Amount in Thousands") +
  ggtitle("Debts and Assets of Lowest 20% of American Earners") +
  scale_color_identity(name = '',
                       breaks = c('black', '#fc5c88'),
                       labels = c("Assets", "Debt"),
                       guide = 'legend') +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))



#Health status of those under poverty line
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct), color = '#00853f', size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9])), color = "#1d65a0", linetype = 'twodash', size = 1.5) +
  ylim(18,22) +
  xlab("Year") + 
  ylab("Percentage") +
  ggtitle("Percentage of Impoverished Reporting Fair or Poor Health") + 
  theme(legend.position="none") +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))




#############################################################################################################
# Example of combining two data sets #
ggplot() +
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  scale_x_date(limits = as.Date(c("2005-01-01","2021-01-01"))) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")



#Health Status of White v Black example plot
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = White, color = 'blue4'), size = 1.5) +
  geom_line(aes(y = Black, color = 'darkgreen'), size = 1.5) +
  scale_color_identity(name = '',
                       breaks = c('blue4', 'darkgreen'),
                       labels = c("White", "Black"),
                       guide = 'legend') +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = 'black', linetype = 'dotted'),
        panel.grid.minor = element_line(color = 'black', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))




