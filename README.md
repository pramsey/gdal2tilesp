# Credits

* [Jorge Arévalo](https://github.com/jorgeas80) wrote this enhancement.

# Introduction

This enhancement to the [gdal2tiles.py script](http://www.gdal.org/gdal2tiles.html) includes the following additional features:

* Parallel processing, to use all available machine cores when generating tiles. This speeds up tile creation considerably.
* Support for both the [TMS](http://wiki.osgeo.org/wiki/Tile_Map_Service_Specification) and [XYZ](http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames) tile cache formats. Use the -o flag to choose; XYZ is the default format.
* Support for both PNG and JPEG tile outputs. Use the -f flag to choose; PNG is the default format.
 
Run ``gdal2tilesp.py --help`` to check all the command-line parameters of the script.

## Notes
* Generates [Leaflet](http://leafletjs.com) layer for use with the XYZ default format.   Where the `tms` parameter is set to `false`
```
var lyr = L.tileLayer('./{z}/{x}/{y}.png', {tms: false, opacity: 1.0, attribution: ""});
```
# Caveats

* The ``epsg::900913`` projection code is not supported, use ``epsg:3857`` to generate a tile set in web mercator projection.

