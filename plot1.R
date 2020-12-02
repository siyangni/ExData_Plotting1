# Loading the data

df <- read.table("data/household_power_consumption.txt", skip=1, sep=";")
names(df) <- c("Date","Time","Global_active_power",
                  "Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
df <- subset(df, df$Date=="1/2/2007" | df$Date =="2/2/2007")
dim(df)


# Transforming the Date and Time vars

df$Date <- as.Date(df$Date, format="%d/%m/%Y") # as Date objecd
df$Time<- strptime(df$Time, format="%H:%M:%S") # As POSIXlt

# Readjust Time Variable foramt
df[1:1440,2] <- format(df[1:1440,2],"2007-02-01 %H:%M:%S")
df[1441:2880,2] <- format(df[1441:2880,2],"2007-02-02 %H:%M:%S")


# Creating first plot

png(filename="plot1.png", width=480, height=480)

hist(as.numeric(df$Global_active_power), col="red",
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

dev.off()