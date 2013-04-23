## @knitr global.R
## global.R
require(Lahman)
require(ggplot2)
require(plyr)

dat = Teams[,c('yearID', 'name', 'G', 'SO')]
team_data = na.omit(transform(dat, SOG = round(SO/G, 2)))
league_data = ddply(team_data, .(yearID), summarize, SOG = mean(SOG))

THRESHOLD = 30
team_appearances = count(team_data, .(name))
teams_in_menu = subset(team_appearances, freq > THRESHOLD)$name
