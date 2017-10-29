cmake_minimum_required(VERSION 2.8.12)
project(deeploco)

find_package(Boost COMPONENTS system filesystem regex REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Bullet REQUIRED)
find_package(OpenCV REQUIRED)
find_package(Caffe REQUIRED)

file(GLOB_RECURSE header_files "*.h")
file(GLOB_RECURSE source_files "*.cpp")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_executable(deeploco ${source_files})
target_compile_definitions(deeploco PRIVATE ${Opencv_DEFINITIONS} CPU_ONLY)
target_include_directories(deeploco SYSTEM PRIVATE
    ${EIGEN3_INCLUDE_DIRS}
    ${BULLET_INCLUDE_DIRS}
    ${Caffe_INCLUDE_DIRS})
target_link_libraries(deeploco PRIVATE
    ${Boost_LIBRARIES}
    ${BULLET_LIBRARIES}
    ${OpenCV_LIBRARIES}
    ${Caffe_LIBRARIES}
)
