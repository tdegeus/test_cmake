
include(CMakeFindDependencyMacro)

if(NOT TARGET myproject)
    include("${CMAKE_CURRENT_LIST_DIR}/myprojectTargets.cmake")
endif()

if(NOT TARGET myproject::extra)
    add_library(myproject::extra INTERFACE IMPORTED)
    if(MSVC)
        set_property(TARGET myproject::extra PROPERTY INTERFACE_COMPILE_OPTIONS /W4)
    else()
        set_property(TARGET myproject::extra PROPERTY INTERFACE_COMPILE_OPTIONS -Wall)
    endif()
endif()
