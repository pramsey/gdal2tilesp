# Credits

* [Jorge Arévalo](https://github.com/jorgeas80) wrote this enhancement.

# Introduction

This enhancement to the [gdal2tiles.py script](http://www.gdal.org/gdal2tiles.html) includes the following additional features:

* Parallel processing, to use all available machine cores when generating tiles. This speeds up tile creation considerably.
* Support for both the [TMS](http://wiki.osgeo.org/wiki/Tile_Map_Service_Specification) and [XYZ](http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames) tile cache formats. Use the -o flag to choose; XYZ is the default format.
* Support for both PNG and JPEG tile outputs. Use the -f flag to choose; PNG is the default format.

## Install

```bash
#
#python3 -m ensurepip

# install from local directory
pip install .
# Successfully installed gdal2tilesp.py-3.14.15926
```

### Docker

The project [roblabs/gdal-geopdf](https://github.com/roblabs/gdal-geopdf/blob/usgs/Dockerfile) makes use of this Python script in a Dockerfile.

## Command Line
Run ``gdal2tilesp.py --help`` to check all the command-line parameters of the script.

```bash
Usage: gdal2tilesp.py [options] input_file(s) [output]

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -p PROFILE, --profile=PROFILE
                        Tile cutting profile (mercator,geodetic,raster) -
                        default 'mercator' (Google Maps compatible)
  -r RESAMPLING, --resampling=RESAMPLING
                        Resampling method (average,near,bilinear,cubic,cubicsp
                        line,lanczos,antialias) - default 'average'
  -s SRS, --s_srs=SRS   The spatial reference system used for the source input
                        data
  -z ZOOM, --zoom=ZOOM  Zoom levels to render (format:'2-5' or '10').
  -e, --resume          Resume mode. Generate only missing files.
  -a NODATA, --srcnodata=NODATA
                        NODATA transparency value to assign to the input data
  --processes=PROCESSES
                        Number of concurrent processes (defaults to the number
                        of cores in the system)
  -v, --verbose         Print status messages to stdout

  KML (Google Earth) options:
    Options for generated Google Earth SuperOverlay metadata

    -k, --force-kml     Generate KML for Google Earth - default for 'geodetic'
                        profile and 'raster' in EPSG:4326. For a dataset with
                        different projection use with caution!
    -n, --no-kml        Avoid automatic generation of KML files for EPSG:4326
    -u URL, --url=URL   URL address where the generated tiles are going to be
                        published

  Web viewer options:
    Options for generated HTML viewers a la Google Maps

    -w WEBVIEWER, --webviewer=WEBVIEWER
                        Web viewer to generate
                        (all,google,openlayers,leaflet,index,metadata,none) -
                        default 'all'
    -t TITLE, --title=TITLE
                        Title of the map
    -c COPYRIGHT, --copyright=COPYRIGHT
                        Copyright for the map
    -g GOOGLEKEY, --googlekey=GOOGLEKEY
                        Google Maps API key from
                        http://code.google.com/apis/maps/signup.html
    -y YAHOOKEY, --yahookey=YAHOOKEY
                        Yahoo Application ID from
                        http://developer.yahoo.com/wsregapp/

  Config options:
    Options for config parameters

    -x, --auxfiles      Generate aux.xml files.
    -f OUTPUT_FORMAT, --format=OUTPUT_FORMAT
                        Image format for output tiles. Just WEBP, PNG and JPEG
                        allowed. PNG is selected by default
    -o OUTPUT_CACHE, --output=OUTPUT_CACHE
                        Format for output cache. Values allowed are tms and
                        xyz, being xyz the default value
```

## Notes
* Generates tilesjson in the file index.html, which then is consumed by [KlokanTech `tileview`](https://github.com/klokantech/cdn.klokantech.com).  
  * `tileview` further generates Leaflet, OpenLayers 2 & 3, Google Maps, WebGL, OL3-Cesium, Mapbox JS, and ArcGIS for JavaScript.
* Generates [Leaflet](http://leafletjs.com) layer for use with the XYZ default format.   Where the `tms` parameter is set to `false`
* Generates metatdata.json which is interpreted by [`mb-util`](https://github.com/mapbox/mbutil/blob/9869f0fb632093102588b6aad7a41faf7a574e47/README.md#metadata) for use with [mbtiles](https://www.mapbox.com/help/an-open-platform/#mbtiles).
```
var lyr = L.tileLayer('./{z}/{x}/{y}.png', {tms: false, opacity: 1.0, attribution: ""});
```
# Caveats

* The ``epsg::900913`` projection code is not supported, use ``epsg:3857`` to generate a tile set in web mercator projection.
