if( NOT TARGET Cinder-WMFVideo )
	get_filename_component( WmfVid_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
	get_filename_component( CINDER_PATH "${WmfVid}/../.." ABSOLUTE )
	get_filename_component( WmfVid_SOURCE_PATH "${WmfVid_PATH}/src" ABSOLUTE )


	if(WIN32)
		FILE(GLOB WmfVid_SOURCES ${WmfVid_SOURCE_PATH}/*.cpp ${WmfVid_SOURCE_PATH}/*/*.cpp)
	else(WIN32)
		FILE(GLOB ciFove_SOURCES ${WmfVid_SOURCE_PATH}/*.foobar)
	endif(WIN32)

	add_library( Cinder-WMFVideo ${WmfVid_SOURCES} )

	target_include_directories( Cinder-WMFVideo PUBLIC "${WmfVid_SOURCE_PATH}" )
	target_include_directories( ciFove SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()

	target_link_libraries( Cinder-WMFVideo PRIVATE cinder )
endif()
