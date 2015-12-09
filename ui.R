
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  titlePanel("Simple contact form"),
  
  sidebarPanel(

  textInput('name', 'Name:', value = "", width = NULL),
  textInput('other', 'Other:', value = "", width = NULL),
  textInput('email', 'Email:', value = "", width = NULL),
  textInput('phone', 'Phone', value = "", width = NULL),
  actionButton('submit', "Submit")
  ),
  
  mainPanel(
    uiOutput('table')
  )
))
