#!/bin/sh

cd linuxdoom-1.10
mkdir -p linux
make clean
make -j$(nproc)

cd ..

cd sndserv
mkdir -p linux
make clean
make -j$(nproc)

cd ..

mkdir -p DOOM
cd DOOM
cp ../linuxdoom-1.10/linux/linuxxdoom .
cp ../sndserv/linux/sndserver .

cat >> ./runme.sh << 'EOF'
#!/bin/sh
Xephyr :9 -ac -br -reset -terminate -screen 960x600x8 &
sleep 0.25
DISPLAY=:9 ./linuxxdoom -3 -config ./.doomrc -file *.wad || pkill Xephyr
EOF

fill_doomrc() {
    printf "$1\t\t$2\n" >> ./.doomrc
}

fill_doomrc sndserver \"./sndserver\"
fill_doomrc key_right 174
fill_doomrc key_left 172
fill_doomrc key_up 119
fill_doomrc key_down 115
fill_doomrc key_strafeleft 97
fill_doomrc key_straferight 100
fill_doomrc key_fire 32
fill_doomrc key_use 102

echo
echo "Place Your IWAD in this directory, then run ''. ./runme.sh''"
echo "Note: The file's name should be all lowercase"
echo
echo "I have tested DOOM v1.9 & Shareware, DOOM II v1.9, Ultimate DOOM,"
echo " Final Doom - Plutonia Experiment, and Final Doom - Evilution"
echo "Note: Both Final Doom wads require DOOM II for the sound server"
echo

