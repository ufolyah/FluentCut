# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: BSD-3-Clause

cmake_minimum_required(VERSION 3.24)
project(vulkanPlayground LANGUAGES CXX)

set(INSTALL_EXAMPLEDIR $CMAKE_CURRENT_SOURCE_DIR/build)

set(CMAKE_PREFIX_PATH "E:/Qt/6.6.2/msvc2019_64/lib/cmake/Qt6")

message(STATUS "vulkan env" $ENV{VULKAN_SDK})
find_package(Qt6 REQUIRED COMPONENTS Concurrent Core Gui Widgets)
find_package(Vulkan REQUIRED)

qt_standard_project_setup()

include_directories(BEFORE Vulkan_INCLUDE_DIRS)

qt_add_executable(vulkanPlayground
    camera.cpp camera.h
    main.cpp
    mainwindow.cpp mainwindow.h
    mesh.cpp mesh.h
    renderer.cpp renderer.h
    shader.cpp shader.h
    vulkanwindow.cpp vulkanwindow.h
)

set_target_properties(vulkanPlayground PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)

target_link_libraries(vulkanPlayground PRIVATE
    Qt6::Concurrent
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Vulkan::Vulkan
)

# Resources:
set_source_files_properties("/block.buf"
    PROPERTIES QT_RESOURCE_ALIAS "block.buf"
)

set_source_files_properties("qt_logo.buf"
    PROPERTIES QT_RESOURCE_ALIAS "qt_logo.buf"
)

set(vulkanPlayground_resource_files
    "block.buf"
    "qt_logo.buf"
    "color_frag.spv"
    "color_phong_frag.spv"
    "color_phong_vert.spv"
    "color_vert.spv"
)

qt6_add_resources(vulkanPlayground "vulkanPlayground"
    PREFIX
        "/"
    FILES
        ${vulkanPlayground_resource_files}
)

install(TARGETS vulkanPlayground
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
