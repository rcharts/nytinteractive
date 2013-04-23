## @knitr ui.R
## ui.R
require(rCharts)
shinyUI(pageWithSidebar(
  headerPanel("NY Times Graphic, using rCharts and PolychartJS"),
  
  sidebarPanel(
    selectInput(inputId = 'team',
      label = "Strikeouts per team per game",
      choices = teams_in_menu,
      selected = 'Boston Red Sox'),
    includeMarkdown('note.md')
  ),
  mainPanel(
    showOutput("myChart", "polycharts")
  )
))