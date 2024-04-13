cmake_minimum_required(VERSION 3.24) #FindVulkan.cmake requires 3.24 to work

project(FluentCutCore)

find_package(Vulkan REQUIRED)

include_directories(BEFORE Vulkan_INCLUDE_DIRS)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_compile_options(/W3 /WX)
endif

add_executable(hello 
    test.cpp
)