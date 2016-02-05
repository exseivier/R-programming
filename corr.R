corr <- function(directory, t = 0) {
        correlations <- c()
        for (i in 1:332) {
                sulfate <- c()
                nitrate <- c()
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
                                sulfate <- c(sulfate, df[j,2])
                                nitrate <- c(nitrate, df[j,3])
                        }
                }
                if (count > t) {
                        correlation <- cor(sulfate, nitrate)
                        correlations <- c(correlations, correlation)
                } else {
                #do nothing
                }
                
        }
        correlations

}
