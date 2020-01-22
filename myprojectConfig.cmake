
include(CMakeFindDependencyMacro)

if(NOT TARGET myproject)
    include("${CMAKE_CURRENT_LIST_DIR}/myprojectTargets.cmake")
endif()

if(NOT TARGET myproject::extra)
    add_library(myproject::extra INTERFACE IMPORTED)
    if(MSVC)
        target_compile_options(myproject::extra INTERFACE /W4)
    else()
        target_compile_options(myproject::extra INTERFACE -Wall)
    endif()
endif()
