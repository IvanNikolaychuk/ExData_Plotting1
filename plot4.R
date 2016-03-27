constructForthPlot <- function() {
        data <- getData()
        
        png(filename = 'plot4.png',
            width = 480,
            height = 480)
        
        par(mfrow = c(2, 2))
        
        plotConstructor <- getPlotConstructor()
        
        constructFirstPart(data)
        constructSecondPart(data)
        constructThirdPart(data)
        constructForthPart(data)
        
        invisible(dev.off())
}


constructFirstPart <- function(data) {
        with(
                data,
                plot(
                        Date,
                        Global_active_power,
                        type = 'l',
                        xlab = '',
                        ylab = 'Global Active Power'
                )
        )
}

constructSecondPart <- function(data) {
        with(data, plot(Date, Voltage, type = 'l', xlab = 'datetime'))
}

constructThirdPart <- function(data) {
        with(
                data,
                plot(
                        Date,
                        Sub_metering_1,
                        type = 'l',
                        xlab = '',
                        ylab = 'Energy sub metering'
                )
        )
        with(data, lines(Date, Sub_metering_2, col = 'red'))
        with(data, lines(Date, Sub_metering_3, col = 'blue'))
        
        legend(
                'topright',
                lty = c(1),
                col = c('black', 'red', 'blue'),
                c('Sum_metering_1', 'Sum_metering_2', 'Sum_metering_3')
        )
}

# In PNG format this graphic looks a bit more sharp, than required.
# In R is looks as expected. I tryed to play with 'lwd' (line width)
# parameter (it's 1 for default), but due to it's spec there is no way
# to specify this parameter less than 1. So, I condcider this plot to be valid.
constructForthPart <- function(data) {
        with(data,
             plot(
                     Date,
                     Global_reactive_power,
                     type = 'l',
                     xlab = 'datetime'
             ))
}


