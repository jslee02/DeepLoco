cmake_minimum_required(VERSION 2.8.12)
project(DeepLoco)

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

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/external)

add_subdirectory(external/LodePNG)

add_subdirectory(util)
add_subdirectory(anim)
add_subdirectory(learning)
add_subdirectory(render)
add_subdirectory(sim)
add_subdirectory(scenarios)

file(GLOB hdrs "*.h")
file(GLOB srcs "*.cpp")
add_executable(DeepLoco ${hdrs} ${srcs})
target_compile_definitions(DeepLoco PRIVATE ${Opencv_DEFINITIONS} CPU_ONLY)
target_include_directories(DeepLoco SYSTEM
  PRIVATE
    ${EIGEN3_INCLUDE_DIR}
    ${Boost_INCLUDE_DIRS}
    ${BULLET_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${Caffe_INCLUDE_DIRS}
    ${GLEW_INCLUDE_DIRS}
)
target_link_libraries(DeepLoco
  PRIVATE
    external-lodepng
    deepLocoScenarios
    deepLocoLearning
    deepLocoAnim
    deepLocoSim
    deepLocoUtil
    deepLocoRender
    ${Boost_LIBRARIES}
    ${BULLET_LIBRARIES}
    ${OpenCV_LIBRARIES}
    ${Caffe_LIBRARIES}
    ${OPENGL_LIBRARIES}
    ${GLUT_glut_LIBRARY}
    ${GLEW_LIBRARIES}
)

add_subdirectory(optimizer)
