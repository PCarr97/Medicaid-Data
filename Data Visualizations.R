### Data Visualizations ###
eligibility |> ggplot() +
  geom_point(aes(x = year, y = eligibility))