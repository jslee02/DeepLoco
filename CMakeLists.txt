cmake_minimum_required(VERSION 2.8.12)
project(deeploco)

list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_SOURCE_DIR}/cmake") 

find_package(Boost COMPONENTS system filesystem regex REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Bullet 2.82 REQUIRED) # requires >= 2.82
find_package(OpenCV REQUIRED)
find_package(Caffe REQUIRED)
find_package(OpenGL REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
find_package(GLEW REQUIRED)

if(CMAKE_VERSION VERSION_LESS "3.1")
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
  endif()
else()
  set(CMAKE_CXX_STANDARD 11)
endif()

file(GLOB_RECURSE header_files "*.h")
file(GLOB_RECURSE source_files "*.cpp")

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_executable(deeploco ${source_files})
target_compile_definitions(deeploco PRIVATE ${Opencv_DEFINITIONS} CPU_ONLY)
target_include_directories(deeploco SYSTEM PRIVATE
    ${EIGEN3_INCLUDE_DIR}
    ${Boost_INCLUDE_DIRS}
    ${BULLET_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${Caffe_INCLUDE_DIRS}
    ${GLEW_INCLUDE_DIRS}
)
target_link_libraries(deeploco PRIVATE
    ${Boost_LIBRARIES}
    ${BULLET_LIBRARIES}
    ${OpenCV_LIBRARIES}
    ${Caffe_LIBRARIES}
    ${OPENGL_LIBRARIES}
    ${GLUT_glut_LIBRARY}
    ${GLEW_LIBRARIES}
)
