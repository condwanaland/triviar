library(shiny)

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel(""),

    sidebarLayout(
        sidebarPanel(
        ),

        mainPanel(
           plotOutput()
        )
    )
)

# Define server logic
server <- function(input, output) {


}

# Run the application
shinyApp(ui = ui, server = server)
