# This R script calculates the mean for each of both pollutants along a set of data files.
# Javier Montalvo
# usrbinjavo@gmail.com
pollutantmean <- function(directory, pollutant, id = 1:332) {
        valuesOfvalues <- c()
        for (i in id) {
                if (i < 10){
                        filename <- paste("00", i, sep="")
                } else if (i >= 10 & i < 100){
                        filename <- paste("0", i, sep="")
                } else {
                        filename <- paste("", i, sep="")
                }
                filepath <- paste(directory, filename, ".csv", sep="")
                df <- read.csv(filepath, header=TRUE)
                values <- df[pollutant]
                valuesOfvalues <- c(valuesOfvalues, values[,1])
        }
        valuesOfvalues <- valuesOfvalues[!is.na(valuesOfvalues)]
        mean(valuesOfvalues)

}
