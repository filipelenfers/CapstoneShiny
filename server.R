
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("model.R")

shinyServer(function(input, output) {
  
  output$predicted.word <- renderUI({
    li <- paste(paste0("<li>", predict(input$sentence), "</li>"), collapse ="" )
    li <- paste("<ul>",li,"</ul>",sep = "")
    HTML(li)
  })
  
  output$input <- renderText({
    input$sentence
  })

})
