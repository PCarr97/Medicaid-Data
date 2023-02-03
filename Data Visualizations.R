### Data Visualizations ###
eligibility |> ggplot() +
  geom_point(aes(x = Year, y = Percent))