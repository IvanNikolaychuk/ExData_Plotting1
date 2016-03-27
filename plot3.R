constructThirdPlot <- function() {
        data <- getData()
        
        png(filename = 'plot3.png',
            width = 480,
            height = 480)
        
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
        
        invisible(dev.off())
}