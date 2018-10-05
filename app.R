#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
CharterEnrollmentSampleData_rdata
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "y", 
                    label = "Y-axis:",
                    choices = c("CaseMonth"          = "CaseMonth", 
                                "CaseYear"          = "CaseYear", 
                                "ActualValue"        = "ActualValue", 
                                "ForeMonth"              = "ForeMonth", 
                                "ForeYear"              = "ForeYear",
                                "ForecastValue"              = "ForecastValue", 
                                "Difference"              = "Difference",
                                "DifferencePerc"              = "DifferencePerc"), 
                    selected = "CaseMonth"),
        
        # Select variable for x-axis
        selectInput(inputId = "x", 
                    label = "X-axis:",
                    choices = c("CaseMonth"          = "CaseMonth", 
                                "CaseYear"          = "CaseYear", 
                                "ActualValue"        = "ActualValue", 
                                "ForeMonth"              = "ForeMonth", 
                                "ForeYear"              = "ForeYear",
                                "ForecastValue"              = "ForecastValue", 
                                "Difference"              = "Difference",
                                "DifferencePerc"              = "DifferencePerc"), 
                    selected = "CaseYear"),
        
        # Select variable for color
        selectInput(inputId = "z", 
                    label = "Color by:",
                    choices = c(
                                "CaseMonth"              = "CaseMonth"), 
                    selected = "CaseMonth")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     ggplot(data = CharterEnrollmentSampleData_rdata, aes_string(x = input$x, y = input$y,
                                   color = input$z, size = 4)) +
       geom_point()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

