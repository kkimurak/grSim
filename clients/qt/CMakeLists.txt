cmake_minimum_required(VERSION 2.8)

set(CMAKE_AUTOMOC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(libs)

find_package(Qt5 COMPONENTS Core Widgets Network REQUIRED)
list(APPEND libs Qt5::Core Qt5::Widgets Qt5::Network)


find_package(Protobuf REQUIRED)
include_directories(${PROTOBUF_INCLUDE_DIRS})
list(APPEND libs ${PROTOBUF_LIBRARIES})

protobuf_generate_cpp(PROTO_CPP PROTO_H
    ../../src/proto/grSim_Replacement.proto
    ../../src/proto/grSim_Commands.proto
    ../../src/proto/grSim_Packet.proto
)

# exclude generated header files from Qt Automoc
set(CLIENT_AUTOGEN_FILES ${PROTO_H};${PROTO_CPP})
foreach(protoc_header IN LISTS CLIENT_AUTOGEN_FILES)
  set_property(SOURCE ${protoc_header} PROPERTY SKIP_AUTOMOC ON)
endforeach(protoc_header)

set(app client)

add_executable(${app} MACOSX_BUNDLE
    ${PROTO_CPP}
    ${PROTO_H}
    main.cpp
    mainwindow.cpp
    mainwindow.h
)

target_link_libraries(${app} ${libs})

