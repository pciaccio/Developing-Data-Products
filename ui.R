library(shiny)

# Define UI for application that shows progress towards a weight loss goal
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Weight Loss Project"),
  
  # Sidebar input goal, starting, and current weights 
  sidebarPanel(
    numericInput('goal', 'Your Goal Weight',150,min=100,max=600,step=0.1),
    numericInput('weight', 'Weight, in lbs',200,min=100,max=600,step=0.1),
    dateInput("date","Date:"),
    actionButton("goButton3", "Set Goal Weight"),
    actionButton("goButton", "Set Starting Weight"),
    actionButton("goButton2", "Set Current Weight")
  ),
  
  
  # Show the calculation of weight loss
  mainPanel(
    h2('Results of weight loss'),
    htmlOutput('text1'),
    htmlOutput('text2'),
    htmlOutput('text3'),
    verbatimTextOutput('text4')
    )
))
