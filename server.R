# This is the server.R document for the weight loss project
#
# This uses the inputs for goal, starting, and current weights
# to figure out your progress towards your weight loss goal
#

library(shiny)

# calulates the change between the starting weight and the current weight
loss<-function(weight1,weight2) round(weight1-weight2,digits=1) 

# calculates the percentage of body weight lost
p<-function(weight1,weight2) round(((weight1-weight2)/weight1)*100,digits=2)

# calculates the number of days between the starting weight and the current weight
d<-function(date1,date2) date2-date1

# calculates the amount of weight you still need to lose to meet your goal weight
g<-function(goal,weight2) round(weight2-goal,digits=1)

# Define server logic required to calculate the loss change
shinyServer(
  function(input, output, session) {

    
    weight1<-eventReactive(    # only updates the starting weight when the action button is hit
      input$goButton, {isolate(input$weight)})
    weight2<-eventReactive(    # only updates the current weight when the action button is hit
      input$goButton2, {input$weight})
    date1<-eventReactive(     # only updates the starting date when the action button is hit
      input$goButton, {isolate(input$date)})
    date2<-eventReactive(     # only updates the current date when the action button is hit
      input$goButton2, {input$date})
    goal<-eventReactive(      # only updates the goal weight when the action button is hit
      input$goButton3, {isolate(input$goal)})
      
    # creates the output for the app  
    output$text1<-renderUI({
      paste("Your goal weight is",goal(),"lbs")})
    output$text2<-renderUI({
      paste("You weighed",weight1(),"lbs on", date1())})
    output$text3<-renderUI({
      paste("You weighed", weight2(), "lbs on", date2())})
    output$text4<-renderText({
      if(loss(weight1(),weight2())>=0){
        str1<-paste("In the last", d(date1(),date2()), "days you have lost", loss(weight1(),weight2()), "lbs and",p(weight1(),weight2()),"% of your body weight")
        str2<-paste("Goog Job! Keep up the good work!")
      }else{
        str1<-paste("In the last", d(date1(),date2()), "days you have gained", -loss(weight1(),weight2()), "lbs.")
        str2<-paste("Time to rethink your diet and exercise plan.")
      }
      if (g(goal(),weight2())>0){
        str3<-paste("You need to lose", g(goal(),weight2()), "more pounds to meet your goal")
      } else {
        str3<-paste("CONGRATULATIONS!!! You have met your goal of", goal(), "lbs")
      }
      paste(str1, str2, str3, sep="\n")
    })
  }
)
