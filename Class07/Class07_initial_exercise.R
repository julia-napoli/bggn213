grade2 <- function(x, drop.lowest = TRUE) {
  x <- as.numeric(x)
  x[is.na(x)] = 0
  if (drop.lowest) {
    mean(x[which.min(x)])
  } else {
    mean(x)
  }
}