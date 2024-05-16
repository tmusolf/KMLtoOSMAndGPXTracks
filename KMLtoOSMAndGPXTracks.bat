@echo off
echo.
echo Batch file to run utility to convert a google maps KML file 
echo into GPX files.  A folder is created using the basename of the KML
echo file.  All waypoints are placed in a single file and each track is placed
echo in it's own file using the track name.  OSMAnd specific extensions are used
echo in the GPX files.  Waypoint icons are translated from KML to an OSMAnd equivalent
echo according to a table found in the utility.
echo.

set pyprogram="U:\Projects\Computer Projects\PC Software\KMLtoOSMAndGPXTracks\KMLtoOSMAndGPXTracks.py"
if exist %pyprogram% goto getinput
echo ***Python program not found***
echo Update the pyprogram variable in this batch file to be the fully qualified path and file name for 
echo the utility.
echo.
goto end
:getinput
echo.
set /p file= "Enter KML base file name without path and .KML extension (assumes download dir): "
set infile="C:\Users\%USERNAME%\Downloads\%file%.kml"

if exist %infile% goto execute 
echo.
echo ***Missing input file: %infile% ***
echo.
goto end
:execute
py %pyprogram% %infile% -w 12 -e -a -s distance -i 1.0
:end
echo.
echo Done
pause
