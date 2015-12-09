
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session) {
  values <- reactiveValues()
  values$df <- data.frame(name = NA,
                          other = NA,
                          email = NA,
                          phone = NA)
  
  newEntry <- observe({
    if(input$submit > 0) {
      newLine <- isolate(c(input$name, 
                           input$other,
                           input$email,
                           input$phone))
      
      isolate(values$df <- rbind(values$df, 
                                 newLine))
      write.csv(values$df, file='contacts.csv', row.names=FALSE)
      
        updateTextInput(session, "name", value = " ")     
        updateTextInput(session, "other", value = " ")    
        updateTextInput(session, "email", value = " ")    
        updateTextInput(session, "phone", value = " ")   
    }
  })
  
  #write.csv({values$df}, file='contacts.csv', row.names=FALSE)
  output$table <- renderTable({values$df})
})

