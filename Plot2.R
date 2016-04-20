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

##Generating Plot 2
plot(tidy_data$Global_active_power ~ tidy_data$Datetime,
     type = "l",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

##Copy the plot to a PNG file
dev.copy(png, file = "Plot2.png")
dev.off()

##End

