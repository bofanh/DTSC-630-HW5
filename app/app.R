# DTSC 630 - M01/Spring 2022
# Data Visualization
# HW-05
# May 15, 2022
# Bofan He
# Dr. Cheng



##############################################################################
library(shiny) 
library(ggplot2)

##############################################################################

# Define UI for application that draws a histogram
ui <- navbarPage(
    title = "HOMEWORK 5",
    
    tabPanel( "Main",
              fluidPage(
                  checkboxGroupInput("drv", "Choose type(s) of drv:",
                                     c("4 Wheels Drive" = "4",
                                       "Rear Drive" = "r",
                                       "Front Drive" = "f"),
                                     selected = c("4 Wheels Drive" = "4",
                                                  "Rear Drive" = "r",
                                                  "Front Drive" = "f")
                                     ),
                  plotOutput("plot1")
              )
    ),
    tabPanel(
        "About",
        p("DTSC 630 - M01/Spring 2022"),
        p("Data Visualization"),
        p("HW-05"),
        p("May 15, 2022"),
        p("Bofan He"),
        p("Dr. Cheng"),
        hr(),
        tags$iframe(style = "height:1000px; width:100%", src =
                        "DTSC630_HW5.pdf"), #testing pdf view
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    output$plot1 <- renderPlot({
        ggplot(mpg[mpg$drv == input$drv, ], aes(displ, hwy, colour = factor(drv))) +
            geom_point() +
            geom_smooth(se = FALSE) +
            labs(color="drv")+
            xlim(NA, 7)
           
    })
    }

# Run the application 
shinyApp(ui = ui, server = server)
