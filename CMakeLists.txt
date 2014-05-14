cmake_minimum_required(VERSION 2.6)

project (shc)

# A bit of admitted laziness on my part for this project...
FILE(GLOB source_files
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp 
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.c 
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)
ADD_EXECUTABLE(shc ${source_files})
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

INSTALL(PROGRAMS shc DESTINATION bin)
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/docs/shc.1 DESTINATION man/man1)

# A bit of half-*ssed packaging setup so we can bundle .debs 
# currently solely for my own inscrutable purposes.  
INCLUDE(InstallRequiredSystemLibraries)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "shc - Generic Shell "Compiler"(Obfuscator)")
SET(CPACK_PACKAGE_VENDOR "Frank C. Earl <frank@earlconsult.com>")
SET(CPACK_PACKAGE_CONTACT "frank@earlconsult.com")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/README")
SET(CPACK_PACKAGE_VERSION_MAJOR "3")
SET(CPACK_PACKAGE_VERSION_MINOR "8")
SET(CPACK_PACKAGE_VERSION_PATCH "10")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "CMake ${CMake_VERSION_MAJOR}.${CMake_VERSION_MINOR}")
SET(CPACK_STRIP_FILES "bin/shc man/man1/shc.1")
SET(CPACK_GENERATOR "DEB")
INCLUDE(CPack)

ADD_CUSTOM_TARGET(test ${CMAKE_CURRENT_SOURCE_DIR}/tests/build_tests.sh DEPENDS shc)
