# Radare2 CheatSheets

## Command Line 
`-a` Set arch

`-A` Analyze all referenced code

`-d`  Debug the executable

`-s`  Start r2 in sandbox mode

## Project Management 
`P` Open a project

`P.` Information about current loaded project

`P+ <name>` Save project (With no checkes)

`P- <name>` Delete project

`Ps <name>` Save project

`Pl` List projects

## Get info from opened file 
`i` Get info from opened file

`iS` Show sections

`ii` Show imports

`ie` Show entrypoint

`afl` Show functions

## Inspec a function
`pdf` Show function disassembly

`afa` Show function arguments

`afv` Show function variables

`afvn` Rename a variable from a function

`af` Analyse a function

## Visual Mode
`V` Enter visual mode

`v` Open visual panels

`p` Change visual

`"` Change visual

`c` Show cursor

`d` Set function name

`;` Add comment

`;-` Delete comment

`q` Quit visual mode

`s` Step

## Debugging

`db <address>` Set breakpoint

`db- <address>` Remove breakpoint

`db` List breakpoints

`dc` Continue execution

`ds` Step one instruction

`ds <N>` Step N instruction

`dso <N>` Step over N instructions



