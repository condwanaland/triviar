library(shiny)
library(triviar)

#questions <- load(system.file("data", "all_questions.rda", package = "triviar"))
questions <- data("all_questions.rda")

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel(""),

    sidebarLayout(
        sidebarPanel(
        ),

        mainPanel(
        )
    )
)

# Define server logic
server <- function(input, output) {


}

# Run the application
shinyApp(ui = ui, server = server)
