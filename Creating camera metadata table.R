# This script takes the camera metadata (in raw unprocessed form) and the camera trap coordinates 
# And creates a final camera trap metadata table, suitable for using with camtrapR. 

# Set working directory
setwd("D:/Dropbox/FFI Vietnam/Kon Plong/Camera trap survey")

# Import data
metadat.raw <- read.csv("kon plong camera metadata_raw.csv", check.names=F)
# Remove blank rows at bottom of table
metadat.raw <- metadat.raw[!is.na(metadat.raw$station), ]
coords <- read.csv("kon plong camera coords.csv", check.names=F)

# Create final camera trap metadata table
metadat.final <- data.frame(Station=metadat.raw$station, "Camera trap"=metadat.raw$camera, Lat=coords$Lat[match(metadat.raw$station, coords$`CT station`)], Long=coords$Long[match(metadat.raw$station, coords$`CT station`)],  check.names=F)
#...we need to add in the dates on and dates off also, when these are ready...

# Write the csv to disk
write.csv(metadat.final, file="kon plong camera metadata_final.csv", row.names=F)
