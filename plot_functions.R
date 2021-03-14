
#' @param assignments df of variant assignments and cluster probabilities
#' @param n number of varaints to visualize
#' @return ggplot plot object
structure_plot <- function(assignments, n) {
  if (missing(n)) {
    n <- nrow(assignments)
  }
  melt_assignments <- melt(assignments[1:n,],id.vars = c("ID", "assignment"))
  melt_assignments <- melt_assignments[order(melt_assignments$assignment),]
  melt_assignments$ID <- factor(melt_assignments$ID, levels = unique(melt_assignments$ID))
  ggplot(melt_assignments) +
    geom_bar(aes(y = value, x = ID, fill = variable),stat="identity") +
    ylab("Assignment Probability") + xlab("")
}