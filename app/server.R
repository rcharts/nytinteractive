## @knitr server.R
## server.R
require(rCharts)
shinyServer(function(input, output) {
  output$myChart <- renderChart({
    mytooltip = "function(item){return item.SOG + '\n' + item.name + '\n' + item.yearID}"
    p1 <- rPlot(SOG ~ yearID, data = team_data, type = 'point', 
      size = list(const = 2), color = list(const = '#888'), tooltip = mytooltip)
    p1$layer(data = league_data, type = 'line', color = list(const = 'blue'), 
      copy_layer = T, tooltip = NULL)
    p1$layer(data = team_data[team_data$name == input$team,], 
      color = list(const = 'red'), copy_layer = T)
    p1$set(height = 450)
    p1$guides(x = list(title = ""))
    p1$guides(y = list(title = ""))
    p1$set(title = 'Strikeouts per team per game', dom = 'myChart')
    return(p1)
  })
})
