## code to prepare `DATASET` dataset goes here
# First downloaded data from the git repo with git clone
# git clone https://github.com/uberspot/OpenTriviaQA.git
# cd into that directory, then run this script.
# Ruby needs to be installed to successfully run

  if (file.exists("data-raw/README.md")){
    file.remove("data-raw/README.md")
  }

# Call ruby script to convert txt to json
system2("ruby", args = c(
  "data-raw/converter.rb",
  "data-raw/categories/*"))


# Parse json into r data frame
json_files <- list.files("data-raw/categories/",
                         pattern = "*.json",
                         full.names = TRUE)

questions_lists <- lapply(json_files, function(x){
  jsonlite::fromJSON(x, flatten = TRUE)
})

all_questions <- do.call(rbind, questions_lists)

all_questions$choices = as.character(all_questions$choices)

# Write data
#usethis::use_data(all_questions, overwrite = TRUE)
write.csv(all_questions, "all_questions.csv", row.names = FALSE)
