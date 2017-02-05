# Vectors ---------------------------------------------------------------------------
a <- 1
a <- c(1)
a <- c(30L, 44L)
a <- 30L
a <- c(30L)
a <- c("one", "two")
a <- c(30.4, 44.4)
a <- c(TRUE, FALSE)
a <- c(1, "two", FALSE)
a <- c(1, FALSE)

# Lists -----------------------------------------------------------------------------

list(a=1L, b=2.5, c="string", d=FALSE)
a <- list(a=1L, b=2.5, c="string", FALSE)

a["a"]

a[1]
a[[1]]

a["a"]
a[["a"]]

# Data Frame ------------------------------------------------------------------------

# install.packages("tidyverse")
library(tidyverse)

data_frame(
   hours = c(1, 3, 5, 7, 9),
   widgets = c(23, 99, 31, 65, 78)
) %>% View()

View(data_frame(
   hours = c(1, 3, 5, 7, 9),
   widgets = c(23, 99, 31, 65, 78)
))

as.logical(as.character(as.integer(as.numeric(FALSE)) + 1))

FALSE %>%
  as.numeric() %>%
  as.integer() %>%
  as.character() %>%
  as.logical()

db <- data_frame(
   hours = c(1, 3, 5, 7, 9),
   widgets = c(23, 99, 31, 65, 78)
)

db %>%
  filter(widgets > 30) %>%
  summarise(n())

db %>%
  filter(widgets > 30) %>%
  nrow()









