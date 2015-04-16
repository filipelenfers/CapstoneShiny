
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Data Science Capstone - Next word predictor"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("sentence",
                "Input the sentence:",
                "I love to live in New"),
      submitButton("Predict")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Predictions", 
                 p("Here is a list of 3 predicted next words for your sentence: "),
                 htmlOutput('predicted.word'), 
                 br(), 
                 p("Your sentence: "),
                 textOutput("input")), 
        tabPanel("About this app", p("The algorithm used in this app is the Stupid Backoff, more details can be found in ", 
                                     a("http://www.aclweb.org/anthology/D07-1090.pdf", href= "http://www.aclweb.org/anthology/D07-1090.pdf"),
                                     ". This algorithm is fast and simple, perfect for limited enviroments like this web app."
                                     ),
                 p("Profanity will be masked, just showing the first and the last letters, the other letters will be replaced by '*'."),
                 p("This application was done to complete the Coursera Data Science Specialization."),
                 p("Author: Filipe Pais Lenfers <filipelenfers@gmail.com>")
                 )
      )
    )
  )
))
