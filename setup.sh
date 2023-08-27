#!/bin/sh

cd linuxdoom-1.10
mkdir -p linux
make clean
make

cd ..

cd sndserv
mkdir -p linux
make clean
make

cd ..

mkdir -p DOOM
cd DOOM
cp ../linuxdoom-1.10/linux/linuxxdoom .
cp ../sndserv/linux/sndserver .

printf \
"#!/bin/sh\n\
\n\
Xephyr :9 -ac -br -reset -terminate -screen 960x600x8 &\n\
sleep 0.25s\n\
DISPLAY=:9 ./linuxxdoom -3 -file ./*.wad" > runme.sh

printf \
"#!/bin/sh\n\
\n\
Xephyr :9 -ac -br -reset -terminate -screen 1280x800x8 &\n\
sleep 0.25s\n\
DISPLAY=:9 ./linuxxdoom -4 -file ./*.wad" > runme.sh

echo
echo "Place Your IWAD in this directory, then run ''. ./runme.sh''"
echo "Note: The file's name should be all lowercase"
echo
echo "I have tested DOOM v1.9 & Shareware, DOOM II v1.9, Ultimate DOOM,"
echo " Final Doom - Plutonia Experiment, and Final Doom - Evilution"
echo "Note: Both Final Doom wads require DOOM II for the sound server"
echo

