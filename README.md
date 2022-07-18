# makefile

These are some versions of a default makefile file I use for my C++ projects. It works on Windows and Linux (tested on Ubuntu, Pop!OS and Arch so far) with no necessary changes.

# how it works

For this makefile to work, .cpp and .h files must be organized into a folder named "source", then the makefile will create another folder named "objects" and will link header and source files generating .o files and moving into the objects folder automatically and then it will compile the program.

* For changing the project name, just change the 'PROJ_NAME' variable value.

# commands

1) **Compiling the project:**

       make build
_- Just using "make" does the same thing._

2) **Compiling and running the project:**

        make all

3) **Just running the project (after compiled):**

        make run

4) **Cleaning up the project folder (after compiled):**

        make clean
_- Using this command will delete the executable file and the "objects" folder and all the files in it._

#

* This makefile works for C projects as well but this changes will be necessary: replace _g++_ for _gcc_, remove _-std=c++11_ flag and replace all occurences of _.cpp_ for _.c_ .
