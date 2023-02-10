hstatus |> ggplot(aes(x = Year)) + 
  geom_line(aes(y = Under100pct, color = "green"), size = 1.5) +
  geom_line(aes(y = Btwn100and199pct, color = "red"), size = 1.5) +
  geom_line(aes(y = Btwn200and399pct, color = "purple"), size = 1.5) +
  geom_line(aes(y = Over400pct, color = "yellow4"), size = 1.5) +
  geom_vline(aes(xintercept = as.Date(Year[9])), color = "#1d65a0", linetype = 'twodash', size = 1.5) +
  xlab("Year") + 
  ylab("Percentage") +
  ggtitle("Percentage of Reporting Fair or Poor Health by Income") + 
  scale_color_identity(name = '', 
                       breaks = c("green", "red", "purple", "yellow4"),
                       labels = c("Under Poverty Line", "100-199% of Poverty Line", 
                                  "200-399% of Poverty Line", "Above 400% of Poverty Line"),
                       guide = 'legend') +
  theme(panel.background = element_rect(fill = '#fcf9f7', color = 'black'),
        panel.grid.major = element_line(color = '#818a92', linetype = 'dotted'),
        panel.grid.minor = element_line(color = '#818a92', linetype = 'dotted'),
        axis.text.x = element_text(color = 'black', size = 11),
        axis.text.y = element_text(color = 'black', size = 11),
        axis.title.x = element_text(color = 'black', size = 12.5),
        axis.title.y = element_text(color = 'black', size = 12.5),
        plot.title = element_text(size = 14, face = "bold"),
        legend.position = "bottom",
        legend.text = element_text(size = 11))