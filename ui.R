library(shiny)

#data(airquality)
#airquality=as.data.frame(airquality)
#airquality=na.omit(airquality)
#write.csv(airquality,'airquality.csv')
#rm(airquality)
airquality= read.csv('airquality.csv', header = T)
airquality=as.data.frame(airquality)
airquality=airquality[,-1]
w=which(is.na(airquality))
airquality=airquality[-w,]
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Air quality indicator!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      selectInput(inputId = "data", label = "air quality indicator",
                  choices = c("Ozone",'Solar.R','Wind','Temp')),
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
    )
  )
)
