# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/aaronpeng/Desktop/SE/PP/PonyPlayer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug

# Include any dependencies generated for this target.
include src/playlist/CMakeFiles/playlist.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/playlist/CMakeFiles/playlist.dir/compiler_depend.make

# Include the progress variables for this target.
include src/playlist/CMakeFiles/playlist.dir/progress.make

# Include the compile flags for this target's objects.
include src/playlist/CMakeFiles/playlist.dir/flags.make

src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o: src/playlist/CMakeFiles/playlist.dir/flags.make
src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o: src/playlist/playlist_autogen/mocs_compilation.cpp
src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o: src/playlist/CMakeFiles/playlist.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o -MF CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o -c /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist/playlist_autogen/mocs_compilation.cpp

src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.i"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist/playlist_autogen/mocs_compilation.cpp > CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.i

src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.s"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist/playlist_autogen/mocs_compilation.cpp -o CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.s

src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o: src/playlist/CMakeFiles/playlist.dir/flags.make
src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o: ../src/playlist/kv_engine.cpp
src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o: src/playlist/CMakeFiles/playlist.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o -MF CMakeFiles/playlist.dir/kv_engine.cpp.o.d -o CMakeFiles/playlist.dir/kv_engine.cpp.o -c /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/kv_engine.cpp

src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/playlist.dir/kv_engine.cpp.i"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/kv_engine.cpp > CMakeFiles/playlist.dir/kv_engine.cpp.i

src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/playlist.dir/kv_engine.cpp.s"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/kv_engine.cpp -o CMakeFiles/playlist.dir/kv_engine.cpp.s

src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o: src/playlist/CMakeFiles/playlist.dir/flags.make
src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o: ../src/playlist/playlist.cpp
src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o: src/playlist/CMakeFiles/playlist.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o -MF CMakeFiles/playlist.dir/playlist.cpp.o.d -o CMakeFiles/playlist.dir/playlist.cpp.o -c /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/playlist.cpp

src/playlist/CMakeFiles/playlist.dir/playlist.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/playlist.dir/playlist.cpp.i"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/playlist.cpp > CMakeFiles/playlist.dir/playlist.cpp.i

src/playlist/CMakeFiles/playlist.dir/playlist.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/playlist.dir/playlist.cpp.s"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/playlist.cpp -o CMakeFiles/playlist.dir/playlist.cpp.s

src/playlist/CMakeFiles/playlist.dir/controller.cpp.o: src/playlist/CMakeFiles/playlist.dir/flags.make
src/playlist/CMakeFiles/playlist.dir/controller.cpp.o: ../src/playlist/controller.cpp
src/playlist/CMakeFiles/playlist.dir/controller.cpp.o: src/playlist/CMakeFiles/playlist.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/playlist/CMakeFiles/playlist.dir/controller.cpp.o"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/playlist/CMakeFiles/playlist.dir/controller.cpp.o -MF CMakeFiles/playlist.dir/controller.cpp.o.d -o CMakeFiles/playlist.dir/controller.cpp.o -c /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/controller.cpp

src/playlist/CMakeFiles/playlist.dir/controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/playlist.dir/controller.cpp.i"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/controller.cpp > CMakeFiles/playlist.dir/controller.cpp.i

src/playlist/CMakeFiles/playlist.dir/controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/playlist.dir/controller.cpp.s"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/controller.cpp -o CMakeFiles/playlist.dir/controller.cpp.s

src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o: src/playlist/CMakeFiles/playlist.dir/flags.make
src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o: ../src/playlist/info_accessor.cpp
src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o: src/playlist/CMakeFiles/playlist.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o -MF CMakeFiles/playlist.dir/info_accessor.cpp.o.d -o CMakeFiles/playlist.dir/info_accessor.cpp.o -c /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/info_accessor.cpp

src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/playlist.dir/info_accessor.cpp.i"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/info_accessor.cpp > CMakeFiles/playlist.dir/info_accessor.cpp.i

src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/playlist.dir/info_accessor.cpp.s"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist/info_accessor.cpp -o CMakeFiles/playlist.dir/info_accessor.cpp.s

# Object files for target playlist
playlist_OBJECTS = \
"CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/playlist.dir/kv_engine.cpp.o" \
"CMakeFiles/playlist.dir/playlist.cpp.o" \
"CMakeFiles/playlist.dir/controller.cpp.o" \
"CMakeFiles/playlist.dir/info_accessor.cpp.o"

# External object files for target playlist
playlist_EXTERNAL_OBJECTS =

src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/playlist_autogen/mocs_compilation.cpp.o
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/kv_engine.cpp.o
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/playlist.cpp.o
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/controller.cpp.o
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/info_accessor.cpp.o
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/build.make
src/playlist/libplaylist.a: src/playlist/CMakeFiles/playlist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libplaylist.a"
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && $(CMAKE_COMMAND) -P CMakeFiles/playlist.dir/cmake_clean_target.cmake
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/playlist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/playlist/CMakeFiles/playlist.dir/build: src/playlist/libplaylist.a
.PHONY : src/playlist/CMakeFiles/playlist.dir/build

src/playlist/CMakeFiles/playlist.dir/clean:
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist && $(CMAKE_COMMAND) -P CMakeFiles/playlist.dir/cmake_clean.cmake
.PHONY : src/playlist/CMakeFiles/playlist.dir/clean

src/playlist/CMakeFiles/playlist.dir/depend:
	cd /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aaronpeng/Desktop/SE/PP/PonyPlayer /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/src/playlist /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist /Users/aaronpeng/Desktop/SE/PP/PonyPlayer/debug/src/playlist/CMakeFiles/playlist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/playlist/CMakeFiles/playlist.dir/depend

