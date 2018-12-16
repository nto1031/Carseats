#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  library("ISLR")
  library("ggplot2")
  
   output$text2 = renderText({
     diff = input$CompPrice - input$price
     paste("Difference in Price: $", diff, sep = "")
   })
  
  output$text1  = renderText({
    Carseats_new <- Carseats[ , c(1, 2, 6)]
    Carseats_new$Price_diff <- Carseats_new$CompPrice - Carseats_new$Price
    Carseats2 <- Carseats_new[ , c(1, 4)]
    lm2 <- lm(data = Carseats2, Sales ~.)
    
    Price_input <- input$price
    CompPrice_input <- input$CompPrice
    input_df <- data.frame(Price_diff = CompPrice_input - Price_input)
    Prediction_val <- round(predict(lm2, input_df), 2)
    
    paste("Sales: ",Prediction_val, "Carseats", sep = " ")
    })
   
   output$plot1 <- renderPlot({ 
     Carseats_new <- Carseats[ , c(1, 2, 6)]
     Carseats_new$Price_diff <- Carseats_new$CompPrice - Carseats_new$Price
     Carseats2 <- Carseats_new[ , c(1, 4)]
     lm2 <- lm(data = Carseats2, Sales ~.)
     
     Price_input <- input$price
     CompPrice_input <- input$CompPrice
     input_df <- data.frame(Price_diff = CompPrice_input - Price_input)
     Prediction_val <- round(predict(lm2, input_df), 2)
     
     
                        ggplot(data = Carseats_new, aes(x = Price_diff, y = Sales)) + 
                       geom_point() + 
                       stat_smooth(method = "lm") +
                       labs(x = "Price Difference") +
                    geom_hline(yintercept = Prediction_val, linetype = "dashed", color = "red", size = 1.3) +
                    geom_vline(xintercept = (CompPrice_input - Price_input), linetype = "dashed")
                              })
  
})
