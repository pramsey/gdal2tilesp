export INPUT=USA_IFR_Low_Alaska_RESIZE.tif
export OUTPUT=USA_IFR_Low_Alaska_RESIZE

# optionally clean output folder
# rm -rf $OUTPUT

# See https://hub.docker.com/r/roblabs/gdal/
# docker pull roblabs/gdal
docker run --rm -v $(pwd):/data roblabs/gdal ./gdal2tilesp.py -z 1-3 -w all $INPUT

# serve with https://www.npmjs.com/package/serve
cd $OUTPUT
# serve .
# Open URL
open http://localhost:5000/index.html
open http://localhost:5000/googlemaps.html
open http://localhost:5000/leaflet.html
open http://localhost:5000/openlayers.html
