#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Carseat Sales Prediction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("price",
                   "Price:",
                   min = 20,
                   max = 200,
                   value = 90),
       sliderInput("CompPrice",
                   "Competitor's Price: ",
                   min = 20,
                   max = 200,
                   value = 90)
       ),

    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Carseat Sales Predictive Model"),
       h4("Documentation:"),
       h5("This app will help you to predict Carseat Sales based on your price 
          and your competitor's price.  To the left, select the price of your carseats under 'Price'
          and then select your competitor's price under 'Competitor's Price'.  The model below
          will calculate the difference in the two prices (Competitor's price minus your price)
          and predict the number of Sales you can expect.  The horizontal red dotted-line on the
          graph is the predicted number of sales, and the vertical black dotted line is the differnece
          in price.  The blue line is the linear model fitted to Sales and price difference."),
       h5("The predicitive model can be summarized as follows:  for every $1 lower your price is to
         your competitor's price, sales increase by 0.087 carseats.  Likewise, for every dollar
         that you increase your price above your competitor's price, you loose 0.087 carseat sales."),
       h4("Predicted Sales: "),
       strong(textOutput("text2")),
       strong(textOutput("text1")) ,
       plotOutput("plot1")
    )
  )
))
