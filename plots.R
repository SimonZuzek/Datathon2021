## Packages ##
library(ggplot2)
library(data.table)
library(ggmap)
library(scales)
library(sf)
library(maptools)

## Path ## 
path_roads = "geo_data/statesigroad/StateSigRdCorridor_polyline.shp" 



### Goolge API ###
apikey = fread("/path/to/google/api", header = F)
register_google(apikey)

roads = st_read(path_roads)

# roads = readShapeSpatial(path_roads,proj4string = CRS("+proj=longlat +datum=WGS84"))
# roads = fortify(roads)
# roads = st_transform(roads)

map1 = ggmap::get_googlemap("Melbourne", zoom = 10, maptype = "terrain")
map2 = qmap("Melbourne",  zoom = 10, maptype = "toner-lite")
g1 = ggmap(map1) + geom_sf(data = roads, size = 2, color = "#FF9999", inherit.aes = F) +
  xlab("") + ylab("")
g2 = map2 +  geom_sf(data = roads, size = 2, color = "#FF9999", inherit.aes = F) 

g2
g1

ggsave(plot = g2, filename = "out/plots/black_white.png")
ggsave(plot = g1, filename = "out/plots/google.png")

