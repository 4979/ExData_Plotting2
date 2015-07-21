# Exploratory Data Analysis
# Johns Hopkins University - Data Science Specialization.
# Course-Project: 02 (35% of final grade)
# =======================================================
# @author		: Prabhat Kumar
# @copyright: Prabhat Kumar
# @date 		: 21-July-2015
# =======================================================

# Questions: [3]

## Set the Working Directory.
setwd("~/Desktop/Exploratory-Data-Analysis/Course-Project-02")

## Unzip the data.
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")

# Check if both data exist. If not, load the data.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}

subset <- neiData[neiData$fips == "24510", ]

library(ggplot2)
# used to set or query graphical parameters.
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot3.png", width = 480, height = 480, units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
# shuts down the specified (by default the current) device.
dev.off()

## Now, go to run plot4.R
