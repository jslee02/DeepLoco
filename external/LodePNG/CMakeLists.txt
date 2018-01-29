set(target_name external-lodepng)

# Search all header and source files
file(GLOB hdrs "*.hpp" "*.h")
file(GLOB srcs "*.cpp")

add_library(${target_name} ${hdrs} ${srcs})
