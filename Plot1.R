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

##Generating plot1
hist(tidy_data$Global_active_power, 
     col = "red", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

##End

