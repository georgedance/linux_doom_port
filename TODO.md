# TODO
### the todo list
- [x] remove '-Wno-' flags from Makefile
    - [x] fixed (most of) the bugs causing those warnings
        - [ ] purge 'rcsid'?
- [ ] check game and sound server for memory leaks?
- [x] find out why doom segfaults on exit
    - [ ] find out why mousedev segfaults M_SaveDefaults in m_misc.c

### testing
- [ ] test if doom2 crashes upon trying to display help2
- [ ] test masterlevels

### for my proper port
- [ ] fix demo playback version incompatibility
    - [x] fix bouncing lost souls
- [ ] fix ultimate doom shareware/registered thingy not having animated switches
- [ ] remove visplane limit
    - [x] in r_plane.c change #define MAXVISPLANES 
    - [ ] maybe look into BOOM's way of solving it?
        - [ ] implement hash table?
- [ ] redo video and audio code
    - [ ] video
        - [ ] find a library
        - [ ] get a window
        - [ ] get a framebuffer
        - [ ] draw 2 framebuffer
        - [ ] render 2 framebuffer
        - [ ] scale rendering
    - [ ] audio
        - [ ] consider merging into one executable?
        - [ ] get music working
            - [ ] reread readme.txt
            - [ ] midi player?
            - [ ] wad reading?
- [ ] add better controls
    - [ ] add customisable controls
- [ ] add jumping
- [ ] remove walls of text
    - [ ] compare with other source ports
    - [ ] strip out ENDOOM
- [ ] remove #ifdef NORMALUNIX

