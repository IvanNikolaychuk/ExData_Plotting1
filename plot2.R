constructSecondPlot <- function() {
        data <- getData()
        
        png(filename = 'plot2.png',
            width = 480,
            height = 480)
        
        with(
                data,
                plot(
                        Date,
                        Global_active_power,
                        type = "l",
                        xlab = '',
                        ylab = "Global Active Power (killowatts)"
                )
        )
        
        invisible(dev.off())
}