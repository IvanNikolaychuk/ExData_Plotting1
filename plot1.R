constructFirstPlot <- function() {
        data <- getData()
        
        png(filename = 'plot1.png',
            width = 480,
            height = 480)
        
        hist(
                data$Global_active_power,
                xlab = "Global Active Power (killowatts)",
                main = "Global Active Power",
                col = "red",
                ylim = c(0, 1200)
        )
        
        invisible(dev.off())
        
}