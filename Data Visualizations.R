### Data Visualizations ###
install.packages('pacman')
library(pacman)
p_load(tidyverse, dplyr, ggplot2)

# Eligibility plot
eligibility |> 
  ggplot() +
  geom_point(aes(x = Year, y = Percent), size = 2.5, color = "#1d65a0") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(0, 1.4)) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trend") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14))



# Forego plot
forego |> ggplot() +
  geom_line(aes(x = Year, y = Percent), size = 1.5, color = "#f19633") +
  geom_vline(aes(xintercept = as.Date(Year[9])), linetype = 'twodash', size = 1.5, color = "#1d65a0") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(0, 0.17)) +
  xlab("Year") +
  ylab("% Foregoing") +
  ggtitle("Percentage Foregoing Medical Care Due to Cost") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
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
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))




#Finances plot
finances |> ggplot(aes(x = Year)) +
  geom_line(aes(y = Debt, color = '#fc5c88'), size = 1.5) +
  geom_line(aes(y = Assets, color = "black"), size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[5])), linetype = 'twodash', size = 1.5, color = "#1d65a0") +
  xlab("Year") + 
  ylab("Amount in Thousands") +
  ggtitle("Debts and Assets of Lowest 20% of American Earners") +
  scale_color_identity(name = '',
                       breaks = c('black', '#fc5c88'),
                       labels = c("Assets", "Debt"),
                       guide = 'legend') +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))



#Health status of those under poverty line
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct), color = '#00836f', size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9])), color = "#1d65a0", linetype = 'twodash', size = 1.5) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(.18, .22)) +
  xlab("Year") + 
  ylab("Percentage") +
  ggtitle("Percentage of Impoverished Reporting Fair or Poor Health") + 
  theme(legend.position="none") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))



#Health status by income level
hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct, color = '#00836f'), size = 1.5) +
  geom_line(aes(y = Btwn100and199pct, color = '#bb8f00'), size = 1.5) +
  geom_line(aes(y = Btwn200and399pct, color = '#bb0099'), size = 1.5) +
  geom_line(aes(y = Over400pct, color = '#00bc87'), size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9])), color = "#1d65a0", linetype = 'twodash', size = 1.5) +
  xlab("Year") + 
  ylab("Percentage") +
  ggtitle("Percentage of Reporting Fair or Poor Health by Income") + 
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  scale_color_identity(name = '',
                      breaks = c('#00836f', '#bb8f00', '#bb0099', '#00bc87'),
                       labels = c("Beneath Poverty Line", "100-199% of Poverty Line", 
                                  "200-399% of Poverty Line", "Above 400% of Poverty Line"),
                       guide = 'legend') +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"),
        legend.position = "bottom")



#Race Boxplot
hstatus |> ggplot() + 
  geom_boxplot(aes(x = "White", y = White), color = 'black', fill = '#8dd3c7') + 
  geom_boxplot(aes(x = "Black", y = Black), color = 'black', fill = '#80b1d3') +
  geom_boxplot(aes(x = "Hispanic", y = Hispanic), color = 'black', fill = '#bebada') +
  ylab("Health") + 
  xlab("") + 
  ggtitle("Reported Health Status by Race") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))



#Gender Boxplot
hstatus |> ggplot() + 
  geom_boxplot(aes(x = "Male", y = Male), color = 'black', fill = '#80b1d3') + 
  geom_boxplot(aes(x = "Female", y = Female), color = 'black', fill = '#b3de69') +
  ylab("Health") + 
  xlab("") +
  ggtitle("Reported Health Status by Gender") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"),
        legend.position = 'none')



#############################################################################################################
# Example of combining two data sets #
ggplot() +
  geom_point(data = eligibility, aes(x = Year, y = Percent), size = 2.5, color = "blue") +
  geom_line(data = forego, aes(x = Year, y = Percent), size = 1.5) +
  scale_x_date(limits = as.Date(c("2005-01-01","2021-01-01"))) +
  xlab("Year") + 
  ylab("Eligibility as % of Poverty Line") +
  ggtitle("Medicaid Eligibility Trends")


hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct), color = '#00836f', size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9])), color = "#1d65a0", linetype = 'twodash', size = 1.5) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(.18, .22)) +
  xlab("Year") + 
  ylab("Percentage") +
  ggtitle("Percentage of Impoverished Reporting Fair or Poor Health") + 
  theme(legend.position="none") +
  theme(panel.background = element_rect(fill = 'white', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"))