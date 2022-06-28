library(shiny)

server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    airquality$Ozone=na.omit(airquality$Ozone)
    df=switch( EXPR = input$data
               , "Ozone" =airquality$Ozone
               , "Solar.R" =airquality$Solar.R
               , "Wind"= airquality$Wind
               ,"Temp"=airquality$Temp)
    bins <- seq(min(df, na.rm = T), max(df, na.rm = T), length.out = input$bins + 1)
    
    hist(df, breaks = bins, col = "#75AADB", border = "black",
         xlab = as.character(input$data),
         main = paste("Histogram of", input$data, sep = " ") )
    
  })
}
shinyApp(ui,server)
