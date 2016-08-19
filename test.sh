python gdal2tilesp.py -z 7-15 -w all 324511630_Descanso_FSTopo.3857.vrt
# python gdal2tilesp.py -z 12 -w --resume all 324511630_Descanso_FSTopo.3857.vrt
# python gdal2tilesp.py -z 13 -w --resume all 324511630_Descanso_FSTopo.3857.vrt
# python gdal2tilesp.py -z 14 -w --resume all 324511630_Descanso_FSTopo.3857.vrt
# python gdal2tilesp.py -z 15 -w --resume all 324511630_Descanso_FSTopo.3857.vrt

# mb-util 324511630_Descanso_FSTopo.3857 324511630_Descanso_FSTopo.3857.mbtiles
json -I -f 324511630_Descanso_FSTopo.3857/metadata.json -e 'this.name="324511630_Descanso_FSTopo"'
json -I -f 324511630_Descanso_FSTopo.3857/metadata.json -e 'this.geotiff="324511630_Descanso_FSTopo.tif"'
json -I -f 324511630_Descanso_FSTopo.3857/metadata.json -e 'this.geopdf="324511630_Descanso_FSTopo.pdf"'
json -I -f 324511630_Descanso_FSTopo.3857/metadata.json -e 'this.url="http://data.fs.usda.gov/geodata/rastergateway/states-regions/states_zoom.php?stateID=ca"'
