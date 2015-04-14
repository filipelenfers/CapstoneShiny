
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("model.R")

shinyServer(function(input, output) {
  
  output$predicted.word <- renderUI({
    predictions <- predict(input$sentence)
    best <- predictions[1]
    rest <- predictions[2:length(predictions)]
    best <- paste0("<p><b>Best guess:</b> ", best, "</p>")
    li <- paste(paste0("<li>", rest, "</li>"), collapse ="" )
    li <- paste("<p>Other guesses:<ul>",li,"</ul></p>",sep = "")
    HTML(paste0(best,li))
  })
  
  output$input <- renderText({
    input$sentence
  })

})
