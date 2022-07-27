# makefile

These are some versions of a default makefile file I use for my C / C++ projects. It works on Windows and Linux (tested on Ubuntu, Pop!OS and Arch so far) with no necessary changes.

# how it works

For this makefile to work, header and source files must be organized into a folder named "source", then the makefile will create another folder named "objects" and will link header and source files generating .o files into it, automatically, and then it will compile the program.

* For changing the project name, just change 'PROJ_NAME' variable value.

* Else, for switching C / C++, just change the following variable values:

  * **CC**: represents the compiler you are going to use, you can change it into 'gcc' (for C projects) or 'g++' (for C++ projects).
  * **H_EXT**: represents your header files extension, you can use '.h' (for C projects) or '.hpp' (for C++ projects), but '.h' works for both.
  * **S_EXT**: represents your source files extension, you can use '.c' (for C projects) or '.cpp' (for C++ projects).

# commands

1) **Compiling the project:**

       make
_- Using "make all" does the same thing._

2) **Compiling (if needed) and running the project:**

        make run

3) **Cleaning up the project folder (after compiled):**

        make clean
_- Using this command will delete the executable file and the "objects" folder and all the files in it._
