# create_random_choices <- function(){
#
# }


get_questions <- function(){
  csv_questions <- read.csv(
    system.file("data", "all_questions.csv", package = "triviar")
  )

  return(csv_questions)
}
