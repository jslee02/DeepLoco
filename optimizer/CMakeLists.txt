set(target_name DeepLoco_Optimizer)

# Search all header and source files
file(GLOB_RECURSE hdrs "*.hpp" "*.h")
file(GLOB_RECURSE srcs "*.cpp")

add_executable(${target_name} ${hdrs} ${srcs})
target_include_directories(
  ${target_name} SYSTEM
  PUBLIC
    ${EIGEN3_INCLUDE_DIR}
    ${Boost_INCLUDE_DIRS}
    ${BULLET_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${Caffe_INCLUDE_DIRS}
    ${GLEW_INCLUDE_DIRS}
)
target_link_libraries(
  ${target_name}
  PUBLIC
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
