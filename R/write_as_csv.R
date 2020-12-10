#' write_as_csv
#'
#' Write the list of questions as a csv to your working directory
#'
#' @param filename Name of file to be written
#'
#' @return Writes a dataframe as a csv to file system
#' @export
#'
#' @examples
#' triviar::write_as_csv("trivia_questions")
write_as_csv <- function(filename){
  filename <- tools::file_path_sans_ext(filename)
  dat <- utils::data("all_questions")
  utils::write.csv(dat, paste0(filename, ".csv"))
}
