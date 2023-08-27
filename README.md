# linux_doom_port
a project to port the original doom source code to modern linux.

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
