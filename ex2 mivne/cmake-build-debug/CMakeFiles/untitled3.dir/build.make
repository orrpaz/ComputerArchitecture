# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/or/Desktop/clion-2017.2.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/or/Desktop/clion-2017.2.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/or/CLionProjects/untitled3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/or/CLionProjects/untitled3/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/untitled3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/untitled3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/untitled3.dir/flags.make

CMakeFiles/untitled3.dir/ex2.c.o: CMakeFiles/untitled3.dir/flags.make
CMakeFiles/untitled3.dir/ex2.c.o: ../ex2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/or/CLionProjects/untitled3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/untitled3.dir/ex2.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/untitled3.dir/ex2.c.o   -c /home/or/CLionProjects/untitled3/ex2.c

CMakeFiles/untitled3.dir/ex2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/untitled3.dir/ex2.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/or/CLionProjects/untitled3/ex2.c > CMakeFiles/untitled3.dir/ex2.c.i

CMakeFiles/untitled3.dir/ex2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/untitled3.dir/ex2.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/or/CLionProjects/untitled3/ex2.c -o CMakeFiles/untitled3.dir/ex2.c.s

CMakeFiles/untitled3.dir/ex2.c.o.requires:

.PHONY : CMakeFiles/untitled3.dir/ex2.c.o.requires

CMakeFiles/untitled3.dir/ex2.c.o.provides: CMakeFiles/untitled3.dir/ex2.c.o.requires
	$(MAKE) -f CMakeFiles/untitled3.dir/build.make CMakeFiles/untitled3.dir/ex2.c.o.provides.build
.PHONY : CMakeFiles/untitled3.dir/ex2.c.o.provides

CMakeFiles/untitled3.dir/ex2.c.o.provides.build: CMakeFiles/untitled3.dir/ex2.c.o


# Object files for target untitled3
untitled3_OBJECTS = \
"CMakeFiles/untitled3.dir/ex2.c.o"

# External object files for target untitled3
untitled3_EXTERNAL_OBJECTS =

untitled3: CMakeFiles/untitled3.dir/ex2.c.o
untitled3: CMakeFiles/untitled3.dir/build.make
untitled3: CMakeFiles/untitled3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/or/CLionProjects/untitled3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable untitled3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/untitled3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/untitled3.dir/build: untitled3

.PHONY : CMakeFiles/untitled3.dir/build

CMakeFiles/untitled3.dir/requires: CMakeFiles/untitled3.dir/ex2.c.o.requires

.PHONY : CMakeFiles/untitled3.dir/requires

CMakeFiles/untitled3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/untitled3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/untitled3.dir/clean

CMakeFiles/untitled3.dir/depend:
	cd /home/or/CLionProjects/untitled3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/or/CLionProjects/untitled3 /home/or/CLionProjects/untitled3 /home/or/CLionProjects/untitled3/cmake-build-debug /home/or/CLionProjects/untitled3/cmake-build-debug /home/or/CLionProjects/untitled3/cmake-build-debug/CMakeFiles/untitled3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/untitled3.dir/depend
