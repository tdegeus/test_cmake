
cmake_minimum_required(VERSION 3.0)

project(myproject)

add_library(myproject INTERFACE)

set(MYPROJECT_VERSION "1.0.0")

target_include_directories(myproject INTERFACE
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(
    DIRECTORY
        "${CMAKE_CURRENT_SOURCE_DIR}/include/"
    DESTINATION
        include)

install(
    TARGETS
        myproject
    EXPORT
        myproject-targets)

install(
    EXPORT
        myproject-targets
    FILE
        myprojectTargets.cmake
    DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/myproject")

write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/myprojectConfigVersion.cmake"
    VERSION
        ${MYPROJECT_VERSION}
    COMPATIBILITY
        AnyNewerVersion)

install(
    FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/myprojectConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/myprojectConfigVersion.cmake"
    DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/myproject")
