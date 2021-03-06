
set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
set(BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
set(SYSCONFIG_INSTALL_DIR ${CMAKE_INSTALL_SYSCONFDIR})
set(OMNI_CMAKE_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}/)



include(CMakePackageConfigHelpers)

configure_package_config_file(cmake/OmniORBConfig.cmake.in ${PROJECT_BINARY_DIR}/OmniORBConfig.cmake
        INSTALL_DESTINATION ${OMNI_CMAKE_INSTALL_DIR}
        PATH_VARS INCLUDE_INSTALL_DIR SYSCONFIG_INSTALL_DIR)

write_basic_package_version_file(${PROJECT_BINARY_DIR}/OmniORBConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion)

install(FILES ${CMAKE_SOURCE_DIR}/cmake/run_omniidl.cmake ${CMAKE_CURRENT_BINARY_DIR}/OmniORBConfig.cmake ${CMAKE_CURRENT_BINARY_DIR}/OmniORBConfigVersion.cmake
        DESTINATION ${OMNI_CMAKE_INSTALL_DIR})


install(EXPORT ${PROJECT_NAME}Targets
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION ${OMNI_CMAKE_INSTALL_DIR}
        )