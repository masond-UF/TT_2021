# 9 March 2021
# David Mason
# Making a shapefile for Tall Timbers

library(rgdal)  # for vector work; sp package should always load with rgdal. 
library(raster) # for metadata/attributes- vectors or rasters
library(sp)

trap_loc <- read.csv("traps_utm.csv", stringsAsFactors = FALSE)

coordinates(trap_loc) <- c("UTM.Easting", "UTM.Northing")
proj4string(trap_loc) <- CRS("+proj=utm +zone=16 +ellps=GRS80 +datum=NAD83")

plot(trap_loc)

writeOGR(obj=trap_loc, dsn="traps", layer="trap_loc", driver="ESRI Shapefile")

