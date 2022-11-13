cmake_minimum_required(VERSION 3.10)

project(template_project LANGUAGES CXX)

# Set current project version.
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)

# Organize targets into folders.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Extend a list of directories specifying a search path for CMake modules
# to be loaded by the the include() or find_package() commands.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(conan)

conan_cmake_run(CONANFILE conanfile.txt BASIC_SETUP CMAKE_TARGETS BUILD missing)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

set(EXTERNAL_DIR ${CMAKE_SOURCE_DIR}/extern)

option(ENABLE_TESTING "Enable/Disable configuration and building of unit tests" OFF)
option(ENABLE_CLANG_TIDY "Enable/Disable clang-tidy static analysis" OFF)

if (ENABLE_TESTING)
    add_definitions(-DENABLE_TESTING)
endif ()

add_subdirectory(modules/app)

if (ENABLE_TESTING)
	include(CTest)
	enable_testing()
	add_subdirectory(tests)
endif ()

