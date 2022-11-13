cmake_minimum_required(VERSION 3.16)

project(app LANGUAGES CXX)

# put header files here
set(${PROJECT_NAME}_HEADERS

        )

# put sources files here
set(${PROJECT_NAME}_SOURCES
        src/Main.cpp
        )

add_executable(${PROJECT_NAME}
        ${${PROJECT_NAME}_SOURCES}
        ${${PROJECT_NAME}_MISC}
        )

target_link_libraries(${PROJECT_NAME}
        ${CONAN_LIBS}
        )
