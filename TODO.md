# TODO
### the todo list
- [x] remove '-Wno-' flags from Makefile
    - [ ] fix the bugs causing those warnings
- [ ] check game and sound server for memory leaks
- [ ] find out why doom segfaults on exit

### testing
- [ ] test if doom2 crashes upon trying to display help2
- [ ] test masterlevels

### for my proper port
- [ ] fix demo playback version incompatibility
    - [x] fix bouncing lost souls
- [ ] fix ultimate doom shareware/registered thingy not having animated switches
- [ ] remove visplane limit
    - [ ] in r_plane.c change #define MAXVISPLANES 
    - [ ] maybe look into BOOM's way of solving it?
- [ ] redo video and audio code
- [ ] add better controls
    - [ ] add customizable controls
- [ ] add jumping
- [ ] remove walls of text
    - [ ] compare with other sourceother source ports
    - [ ] strip out ENDOOM

