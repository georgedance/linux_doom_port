# linux_doom_port
a project to port the original doom source code to modern linux.

## About
So this was a fun project for me to try out working with a big(ger) code base.
Unless you're on linux, don't try to run it, lol.
It requires that you have `/dev/dsp` on your system, which is an ancient part of OSS, which was superseded by ALSA in 2002. I was somehow able to get ALSA to intercept the old calls to OSS, by inserting a kernel module, but for whatever reason that workaround no longer works for me. If you're having trouble getting the sound server to start (i.e. crashing when it's supposed to play a sound), modify the `Makefile` in `linuxdoom-1.10` and comment out the `-DSNDSERV` with a # symbol on line 9. After that, run `make clean` then `make`.
It also requires that you have an 8 bit display, but that problem can be worked around by using `Xephyr` and tagging on `x8` after specifying the resolution with the `-screen` flag, but that should be handled if you follow the `Steps to Run` Section.
On the `french_vanilla` branch, I'm taking patches here and there from boom, prboom, and chocolate-doom. These should come together to make a fairly standard build.

## Steps to Run
These steps are at least to run on Arch Linux.
If you're using a different distro, check your repos for Xephyr.

1. install Xephyr
```bash
~ $ sudo pacman -Syu
~ $ sudo pacman -S xorg-server-xephyr
```

2. install alsa oss emulation kernel module
```bash
~ $ sudo pacman -S alsa-oss
~ $ sudo modprobe snd_pcm_oss
```

3. download the repo
```bash
~ $ git clone https://github.com/georgedance/linux_doom_port.git
~ $ cd linux_doom_port
```

4. run setup.sh
```bash
~/linux_doom_port $ . ./setup.sh
```

5. copy WADs into DOOM directory
```bash
~/linux_doom_port/DOOM $ cp path/to/wad .
```

6. run runme.sh from DOOM directory
```bash
~/linux_doom_port/DOOM $ . ./runme.sh
```

## Justification
I wanted to try port the original source code of DOOM to 64bit and "modern" linux, trying to keep the intended vanilla experience. A lot of the fixes involved changing 32bit sized variables to 64bit sized variables. Some other fixes included `errno.h` instead of defining it as an external symbol to be linked to later on, which I didn't know used to happen, but definitely makes sense on why you'd do that. (Un?)fortunately modern compilers are a tad more stringent when it comes to that. There was a typo fix, `#ifdef SNDSRV` -> `#ifdef SNDSERV`, which was like all the others. One change I made that changed the intended vanilla experience was on line 748, it involved prepending `./` to the name of the sound server. This was to enable the doom executable to run the sound server from the same folder, rather than installing it on the `$PATH` variable. 

### also:
~~I HAVE NO IDEA WHAT'S GOING ON WITH GITHUB'S CODE DETECTION FEATURE. I DON'T KNOW WHY 95.9% OF THE CODE IS C++ BUT ALSO 0 FILES MATCH???~~
I did a bit of searching online and found [this stack overflow article](https://stackoverflow.com/questions/42724465/why-did-github-decide-my-100-c-repository-was-50-c). Odd that this happens, but I guess it makes sense.
After going through that and committing the above comments, I realised why github's [linguist](https://github.com/github-linguist/linguist)was thinking that all the .h and .c files were C++. It was because of the emacs style mode select at the top of all of the files using C++.

## Original README.TXT
The original README.TXT file can still be accessed via [this link](./README.TXT).

