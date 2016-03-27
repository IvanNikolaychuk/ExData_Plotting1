require(dplyr)
require(tidyr)
# Before running this function you need to have data downloaded and unziped 
getData <- function() {
     
      data <- read.table('household_power_consumption.txt', header = T, sep=";", stringsAsFactors = F)
      # Extract only data for 2007-02-01 and 2007-02-02
      filtered <- subset(data, grepl("^1/2/2007$|^2/2/2007$", Date))

      clean <- cleanData(filtered)
}




cleanData <- function(data) {
        
        data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
        

        # Getting read out of time column (as we appended it's info to Date column)
        # And converting chars that are naturaly numerics to numeric.   
        data <- data %>%
                select(-c(Time)) %>%
                mutate(Global_active_power = as.numeric(Global_active_power),
                       Global_reactive_power = as.numeric(Global_reactive_power),
                       Voltage = as.numeric(Voltage))
}
