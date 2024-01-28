library("readr")

data <- read_csv("TrainingUnclean.csv")

clean_text <- function(text) {
  # Remove punctuation
  text <- tolower(text)
  text <- gsub("[^a-z0-9 ]", "", text)
  return(text)
}

data$Context <- sapply(data$Context, clean_text)
data$Response <- sapply(data$Response, clean_text)

write_csv(data, "TrainingClean.csv")