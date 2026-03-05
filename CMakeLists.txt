cmake_minimum_required(VERSION 3.28)
project(main)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_compile_options(-g -O1 -Wall -Wpedantic)

file(GLOB_RECURSE SRC   CONFIGURE_DEPENDS src/*.cpp)
file(GLOB_RECURSE MODS  CONFIGURE_DEPENDS src/*.cppm)

add_executable(main)

target_sources(main
  PRIVATE ${SRC}
  PUBLIC FILE_SET CXX_MODULES FILES ${MODS}
)

target_link_libraries(main PRIVATE SDL3 tinyobjloader ktx slang)

add_custom_target(run
  COMMAND ./main
  DEPENDS main
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)
