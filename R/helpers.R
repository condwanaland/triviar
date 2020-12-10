create_random_choices <- function(){
  qs <- get_questions()
  cats <- unique(qs$category)
  choices <- sample(cats, 6, replace = FALSE)
  return(choices)
}


get_questions <- function(){
  csv_questions <- read.csv(
    system.file("data", "all_questions.csv", package = "triviar")
  )

  return(csv_questions)
}
