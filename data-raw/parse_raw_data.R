## code to prepare `DATASET` dataset goes here
# First downloaded data from the git repo with git clone
# git clone https://github.com/uberspot/OpenTriviaQA.git
# cd into that directory, then run this script.
# Ruby needs to be installed to successfully run

  if (file.exists("data-raw/OpenTriviaQA/README.md")){
    file.remove("data-raw/OpenTriviaQA/README.md")
  }

# Call ruby script to convert txt to json
system2("ruby", args = c(
  "data-raw/OpenTriviaQA/converter.rb",
  "data-raw/OpenTriviaQA/categories/*"))


# Parse json into r data frame
json_files <- list.files("data-raw/OpenTriviaQA/categories/",
                         pattern = "*.json",
                         full.names = TRUE)

questions_lists <- lapply(json_files, function(x){
  jsonlite::fromJSON(x, flatten = TRUE)
})

all_questions <- do.call(rbind, questions_lists)

usethis::use_data(all_questions, overwrite = TRUE)
