# Damasceene
cmake_minimum_required(VERSION 3.8)  # Ensure you have a recent enough version of CMake # Version 3.25 and above

# Project name
project(OAREPL VERSION 1.0 LANGUAGES CXX)

# cmake_policy(SET CMP0074 NEW)  # Example policy to control how find_package() behaves ###############

# Specify C++ standard
set(CMAKE_CXX_STANDARD 26) # <https://cmake.org/cmake/help/latest/prop_tgt/CXX_STANDARD.html>
set(CMAKE_CXX_STANDARD_REQUIRED True)  

# Optionally, you can check for the compiler's support for C++26
include(CheckCXXCompilerFlag)

# Check if the compiler supports C++26
check_cxx_compiler_flag("-std=c++26" COMPILER_SUPPORTS_CXX26)

if(NOT COMPILER_SUPPORTS_CXX26)
    message(FATAL_ERROR "The compiler does not support C++26. Please use a compatible compiler.")
endif()

# Find required packages

find_package(OpenCV 4.10 REQUIRED)  # Accepts OpenCV version 4.10 and above # <https://opencv.org/releases> stable <https://github.com/opencv/opencv/releases> # NOTE: 5.0.0-alpha is out
find_package(Boost 1.87 REQUIRED COMPONENTS filesystem system)  # Accepts Boost version 1.87 and above # <https://www.boost.org>
find_package(fmt 11.0 REQUIRED)  # For formatting library # Accepts fmt 11.0 and above # <https://fmt.dev/11.0> stable <https://github.com/fmtlib/fmt/releases>
find_package(nlohmann_json 3.11.3 REQUIRED)  # For JSON handling # Accepts nlohmann_json 3.11.3 and above # <https://json.nlohmann.me> stable <https://github.com/nlohmann/json/releases>
find_package(GTest 1.15.2 REQUIRED)  # For unit testing # Accepts GTest 1.15.2 and above # <https://github.com/google/googletest/releases> stable <https://google.github.io/googletest>
find_package(Poco 1.13.2 REQUIRED)  # For networking and utilities # Accepts Poco 1.13.2 and above # <https://github.com/pocoproject/poco/releases> stable <https://pocoproject.org/documentation.html>
find_package(Eigen3 3.4.0 REQUIRED)  # For linear algebra # Accepts Eigen3 3.4.0 and above # <https://gitlab.com/libeigen/eigen/-/releases> stable <https://eigen.tuxfamily.org/index.php?title=Main_Page>

# Include directories
include_directories(
    ${OpenCV_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
    ${fmt_INCLUDE_DIRS}
    ${nlohmann_json_INCLUDE_DIRS}
    ${GTEST_INCLUDE_DIRS}
    ${Poco_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIRS}
)

# Add the main executable
# add_executable(OAREPL main.cpp)  ###############

# Add the main executable
add_executable(OAREPL main.cpp src/module1.cpp src/module2.cpp)  ###############

# Optionally, you can specify additional source files or directories
# If you have a directory with multiple source files, you can use file globbing
file(GLOB_RECURSE SOURCES "src/*.cpp")  # This will include all .cpp files in the src directory
add_executable(OAREPL ${SOURCES})


# Link libraries to the executable
target_link_libraries(OAREPL
    ${OpenCV_LIBS}
    ${Boost_LIBRARIES}
    fmt::fmt
    nlohmann_json::nlohmann_json
    GTest::GTest
    GTest::Main
    Poco::Poco
    Eigen3::Eigen
)

# Optionally, add tests
enable_testing()
add_executable(OAREPL_tests test_main.cpp)  # Assuming you have a test file ###############
target_link_libraries(OAREPL_tests
    GTest::GTest
    GTest::Main
)

# Register tests with CMake
add_test(NAME OAREPLTests COMMAND OAREPL_tests)
