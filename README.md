# KMLtoOSMAndGPXTracks
There is a new utility [GoogleMapToOSMAndGPX](https://github.com/tmusolf/GoogleMapToOSMAndGPX) that goes directly from a google map to OSMAnd GPX files, without having to go through an intermediate KML file stage.  It translates tracks and almost all google maps icons.  It also handles google map layers.

*******

Convert a google my maps KML file to a collection of OSMAnd style GPX files, including icon conversion.

A utility to convert a google maps KML file into GPX files. A folder is created using the basename of the KML file.  All waypoints are placed in a single file and each track is placed in it's own file using the track name.  OSMAnd specific extensions are used in the GPX files.

This is a second version of this utility. The first version, KMLtoOSMAndGPX can also be found on GitHub. It performs a similar conversion, but does not have the option to create track GPX files with one track in each file.  The track and waypoints are either all put in a single file or broken out by KML folder/layer.
## Syntax
```
py KMLtoOSMAndGPXTracks.py <input file> -l -w <width 1-24> -t <transparency 00 to FF> -s <split interval in miles>
``` 
Parm | Long Parm | Description
--- | --- | ---
kml_file | | Input KML file path/name. Required
-a | --arrows | When present, OSMAnd will display directional arrows on a track.
-e | --ends | When present, OSMAnd will display start and finish icons at the ends of the track.
-t | --transparency | Transparency value to use for all tracks.  Specified as a 2 digit hex value without the preceeding "0x".  00 is fully transparent and FF is opaque.
-s | --split | Display distance or time splits along tracks. [no_split, distance, time] Default: no_split.  Appears to be an issue with OSMAnd using the split values from a GPX file.
-i | --interval | When distance or time split option is specified this is the split interval in miles [0.0-100.0] or time in seconds.
-w | --width | If present, this track width is used for all track widths, overiding values found in the KML file. Integer value between 1-24

## KML folders and layers
All folders, waypoints and tracks in the KML file are processed.

## Using GPX files with OSMAnd
From a google maps mymap export the map to a KML file.  Use that KML file as the input file to this utility. After conversion there will be a folder created with the basename of the KML file.  Inside of this folder you will find a single GPX file containing all of the waypoints and then one GPX file for each track found in the KML file.

To use these converted GPX files in OSMAnd they need to be placed in the appropriate OSMAnd tracks folder on your phone. Transfer the folder and it's GPX files to your phone and then use a file manager to copy the entire folder to the Android/media/net.osmand.plus/files/tracks directory.

NOTE: Starting with Android 11 there are enhanced file protection protocals put in place that prevent you from accessing the files in the Android/obb/net.osmand.plus folders. You can change this location to one that is accessible by going to settings/OSMAnd settings/Data storage folder and selecting Manually specified /storage/emulated/0/Android/media/net.osmand.plus/files.

One the folder is transfered you can goto OSMAnd My Places and navigate to the folder.  You can make all the GPX files in the entire folder visible/not visible or you can select them individually.  When they are made visible the tracks will display with the same line color as you specified in your google map.  Waypoints will be converted to an OSMAnd equivalent icon and color.  If an icon is not translated you will need to update the translation library table to show this utility how you want a KML icon translated.

If you use the OSMAnd import feature you will lose a track's color and line width and they will be imported with OSMAnd default values.

To remove the GPX files from OSMAnd you can use a file manager or OSMAnd My Places to delete individual GPX files or the entire folder.

You can also use My Places to edit the appearance of the tracks and waypoints. These changes appear not to be written back to the GPX files so any changes you make in this way will be temporary.  If anyone know where OSMAnd stores this information and how it can be accessed, please let me know.
## Parting words
This is a work in progress as I learn more about OSMAnd's handling of imported GPX files. I'm not python guru so the code structure is probably not totally pythonic. At this point there is minimal error checking in the code.  
