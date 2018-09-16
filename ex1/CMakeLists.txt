cmake_minimum_required(VERSION 3.8)
project(ex1)

set(CMAKE_C_STANDARD 90)

set(SOURCE_FILES main.c ex1.c)
add_executable(ex1 ${SOURCE_FILES})