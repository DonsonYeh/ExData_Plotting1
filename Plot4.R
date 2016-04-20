##Reading the complete dataset
com_data <- read.csv("household_power_consumption.txt", 
                     header = T, 
                     sep = ';', 
                     na.strings = "?", 
                     nrows = 2075259, 
                     check.names = F, 
                     stringsAsFactors = F, 
                     comment.char = "", 
                     quote = '\"')
com_data$Date <- as.Date(com_data$Date, format = "%d/%m/%Y")

##Subsetting the tidy data
tidy_data <- subset(com_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Erase the complete dataset to release the memory
rm(com_data)

##Converting the dates
datetime <- paste(as.Date(tidy_data$Date), tidy_data$Time)
tidy_data$Datetime <- as.POSIXct(datetime)

## Generating Plot 4
par(mfrow = c(2,2), 
    mar = c(4,4,2,1), 
    oma = c(0,0,2,0))

with(tidy_data, {
          plot(Global_active_power ~ Datetime, 
               type = "l", 
               ylab = "Global Active Power", 
               xlab = "")
          
          plot(Voltage ~ Datetime, 
               type = "l",
               ylab = "Voltage",
               xlab = "datetime")
          
          plot(Sub_metering_1 ~ Datetime, 
               type = "l", 
               ylab = "Energy sub metering",
               xlab = "")
          
          lines(Sub_metering_2 ~ Datetime, col = 'Red')
          
          lines(Sub_metering_3 ~ Datetime, col = 'Blue')
          
          legend("topright", 
                 col = c("black", "red", "blue"), 
                 lty = 1,
                 lwd = 2, 
                 bty = "n",
                 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
          
          plot(Global_reactive_power ~ Datetime, 
               type = "l", 
               ylab = "Global_reactive_power", 
               xlab = "datetime")
}
)

##Copy the plot to a PNG file
dev.copy(png, file = "Plot4.png")
dev.off()

##End

