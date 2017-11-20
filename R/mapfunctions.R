library(rgdal)
library(mapview)

#Function for convert crs and then outputting a mapview map for easy viewing of spatial data generated in NZTM
#' @export
tomap <- function(x){
  nztm <-"+proj=tmerc +lat_0=0 +lon_0=173 +k=0.9996 +x_0=1600000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
  prj.LatLong <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")#Set CRS to convert to WGS84
  proj4string(x) = CRS(nztm)
  x <-spTransform(x, prj.LatLong)#Convert CRS to WGS84
  mapview::mapview(x)
}

#Function to make it easy to assign NZTM CRS to spatial data and then convert to WGS for use in leaflet
#' @export
coord <- function(x){
  nztm <-"+proj=tmerc +lat_0=0 +lon_0=173 +k=0.9996 +x_0=1600000 +y_0=10000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
  prj.LatLong <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")#Set CRS to convert to WGS84
  proj4string(x) = CRS(nztm)
  x <-spTransform(x, prj.LatLong)#Convert CRS to WGS84
}