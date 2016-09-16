# Reading shapefiles into R

library(rgdal)
library(dplyr)

summary(counties_md)


# Basic spatial plots

plot(counties_md)

howard <- counties_md[counties_md[["NAME"]] == "Howard", ]
plot(howard, add = TRUE, col = "red")
text(coordinates(counties_md), labels = counties_md[["NAME"]], cex = 0.5)

# Exercise

# Starting from a fresh map, print numbers on each county in order of
#  the smallest (1) to largest (24) in land area ("ALAND" attribute). 
# Hint: Use `rank(x)` to get ranks from a numeric vector x.

plot(counties_md)

text(coordinates(counties_md), labels = (counties_md[["ALAND"]] %>% rank()), col = "gray", cex = 0.7)
text(coordinates(counties_md), labels = counties_md[["NAME"]], cex = 0.5, col = "purple", pos = 1)

# Reading rasters into R

library(raster)

nlcd <- raster("data/nlcd_agg.grd")

plot(nlcd)

attr_table <- nlcd@data@attributes[[1]]


# Change projections

proj4string(counties_md)
proj4string(nlcd)

counties_proj <- spTransform(counties_md, proj4string(nlcd))

plot(nlcd)
plot(counties_proj, add = TRUE)


# Masking a raster to change some of info to NA

pasture <- mask(nlcd, nlcd == 81, maskvalue = FALSE)
plot(pasture)
plot(counties_proj, add = TRUE)

# Exercise

wetlands <- mask(nlcd, nlcd == 95, maskvalue = FALSE)
plot(wetlands)
plot(counties_proj, add = TRUE)


# Create a mask for a different land cover class. 
#  Look up the numeric ID for a specific class in attr_table.

...


# Adding data to maps with tmap

library(tmap)

qtm(...)

qtm(counties_proj, fill = ..., ... = "NAME")

map1 <- tm_shape(...) +
            ...() +
            ...("AWATER", title = "Water Area (sq. m)") +
            tm_text(..., size = 0.7)

map1 +
    tm_style_classic(legend.frame = TRUE) +
    tm_scale_bar(position = ...)


# Exercise

# The color scales in tmap are divided into bins by default. 
# Look at the help file for tm_fill: help("tm_fill") to find which argument
#  controls the binning scale. How can you change it to a continuous gradient?

...


# Interactive maps with leaflet

library(leaflet)

imap <- leaflet() %>%
            ...() %>%
            ...(lng = -76.505206, lat = 38.9767231, zoom = ...)

imap %>%
    ...(
        "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
        layers = "nexrad-n0r-900913", group = "base_reflect",
        options = WMSTileOptions(format = "image/png", transparent = TRUE),
        attribution = "Weather data © 2012 IEM Nexrad"
    )
