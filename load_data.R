# Exploratory Data Analysis
# Johns Hopkins University - Data Science Specialization.
# Course-Project: 02 (35% of final grade)
# =======================================================
# @author		: Prabhat Kumar
# @copyright: Prabhat Kumar
# @date 		: 21-July-2015
# =======================================================

## Set the Working Directory.
setwd("~/Desktop/Exploratory-Data-Analysis/Course-Project-02")

## Unzip the data.
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")

## Check if both data exist. If not, load the data.

## PM2.5 Emissions Data (summarySCC_PM25.rds):
##       This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
## Source Classification Code Table.
##      This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source.
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}
head(neiData)
#     fips      SCC Pollutant Emissions  type year
# 4  09001 10100401  PM25-PRI    15.714 POINT 1999
# 8  09001 10100404  PM25-PRI   234.178 POINT 1999
# 12 09001 10100501  PM25-PRI     0.128 POINT 1999
# 16 09001 10200401  PM25-PRI     2.036 POINT 1999
# 20 09001 10200504  PM25-PRI     0.388 POINT 1999
# 24 09001 10200602  PM25-PRI     1.490 POINT 1999

head(sccData)
dim(neiData)        # 6497651   6
dim(sccData)        # 11717    15

## Now, go to run plot1.R
