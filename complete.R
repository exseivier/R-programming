# This R script calculates the total number of complete cases for every data file.
# Author: Javier Montalvo
# usrbinjavo@gmail.com
complete <- function(directory, id = 1:332) {
        idx <- c()
        c <- c()
        for (i in id) {
                count <- 0
                if (i < 10){
                        filename <- paste("00", i, sep="")
                } else if (i >= 10 & i < 100){
                        filename <- paste("0", i, sep="")
                } else {
                        filename <- paste("", i, sep="")
                }
                filepath <- paste(directory, filename, ".csv", sep="")
                df <- read.csv(filepath, header=TRUE)
                for (j in 1:nrow(df)) {
                        if (!(is.na(df[j,2])) & !(is.na(df[j,3]))) {
                                count <- count + 1
                        }
                }
                idx <- c(idx, i)
                c <- c(c, count)
        }
        m_idx_c <- cbind(idx, c)
        df_idx_c <- data.frame(m_idx_c)
        df_idx_c
}
