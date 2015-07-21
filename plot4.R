# Exploratory Data Analysis
# Johns Hopkins University - Data Science Specialization.
# Course-Project: 02 (35% of final grade)
# =======================================================
# @author		: Prabhat Kumar
# @copyright: Prabhat Kumar
# @date 		: 21-July-2015
# =======================================================

# Questions: [4]

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

head(sccData$Short.Name)
# used to set or query graphical parameters.
par("mar"=c(5.1, 4.5, 4.1, 2.1))
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "./figure/plot4.png", 
    width = 480, height = 480, 
    units = "px")
coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
# options(scipen=0)
# options(scipen=999)
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
# shuts down the specified (by default the current) device.
dev.off()

## Now, go to run plot5.R
