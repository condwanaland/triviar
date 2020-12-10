library(shiny)
library(DT)
library(dplyr)
library(triviar)

# csv_questions <- read.csv(
#     system.file("data", "all_questions.csv", package = "triviar")
# )

csv_questions <- get_questions()

# Define UI
ui <- navbarPage(title = "Trivial Pursuit",
                 tabPanel("Setup",
                          sidebarLayout(
                              sidebarPanel(
                                  checkboxGroupInput(
                                      "selectedCategories",
                                      "Select Categories",
                                      choices = unique(csv_questions$category),
                                      selected = create_random_choices()
                                  )
                              ),

                              mainPanel(
                                  textOutput("categoryMessage"),
                                  #DT::DTOutput("questions")
                                  actionButton("startGame", "Start Game")
                              )
                          )
                         ),
                 tabPanel("Game")
)

# Define server logic
server <- function(input, output) {

    filter_questions <- reactive({
        csv_questions %>%
        dplyr::filter(category %in% input$selectedCategories)
    })

    # output$questions <- DT::renderDT({
    #     filter_questions()
    # })

    numCategories <- reactive({
        length(input$selectedCategories)
    })

    output$categoryMessage <- renderText({
        paste("Please select a total of 6 categories. You currently have",
              numCategories(),
              "selected")
              })


}

# Run the application
shinyApp(ui = ui, server = server)
