library(shiny)
library(DT)
library(dplyr)
library(triviar)

# csv_questions <- read.csv(
#     system.file("data", "all_questions.csv", package = "triviar")
# )

csv_questions <- get_questions()

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel(""),

    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput(
                "selectedCategories",
                "Select Categories",
                choices = unique(csv_questions$category),
                selected = "animals"
            )
        ),

        mainPanel(
            DT::DTOutput("questions")
        )
    )
)

# Define server logic
server <- function(input, output) {

    filter_questions <- reactive({
        csv_questions %>%
        dplyr::filter(category %in% input$selectedCategories)
    })

    output$questions <- DT::renderDT({
        filter_questions()
    })


}

# Run the application
shinyApp(ui = ui, server = server)
