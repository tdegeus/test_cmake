
cmake_minimum_required(VERSION 3.0)

project(myexec)

find_package(myproject REQUIRED)

add_executable(myexec main.cpp)

target_link_libraries(myexec PRIVATE
    myproject
    myproject::extra)
