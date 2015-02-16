
find_path(JEMALLOC_INCLUDE_DIR
    NAMES jemalloc/jemalloc.h
)
mark_as_advanced(JEMALLOC_INCLUDE_DIR)
find_library(JEMALLOC_LIBRARY
    NAMES jemalloc
)
mark_as_advanced(JEMALLOC_LIBRARY)

# Copy the results to the output variables.
if (JEMALLOC_INCLUDE_DIR AND JEMALLOC_LIBRARY)
    set(JEMALLOC_VERSION 0)
    file(READ "${JEMALLOC_INCLUDE_DIR}/jemalloc/jemalloc.h" _JEMALLOC_VERSION_CONENTS)
    string(REGEX REPLACE ".*#define[ \t]+JEMALLOC_VERSION[ \t]+\"([^\"]+)\".*" "\\1" JEMALLOC_VERSION "${_JEMALLOC_VERSION_CONENTS}")
endif()


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(JEMalloc
    FOUND_VAR
        JEMALLOC_FOUND
    REQUIRED_VARS
        JEMALLOC_LIBRARY
        JEMALLOC_INCLUDE_DIR
    VERSION_VAR
        JEMALLOC_VERSION
)

if(JEMALLOC_FOUND AND NOT TARGET JEMalloc::JEMalloc)
    add_library(JEMalloc::JEMalloc UNKNOWN IMPORTED)
    set_target_properties(JEMalloc::JEMalloc PROPERTIES
        IMPORTED_LOCATION "${JEMALLOC_LIBRARY}"
        INTERFACE_COMPILE_OPTIONS "${JEMALLOC_DEFINITIONS}"
        INTERFACE_INCLUDE_DIRECTORIES "${JEMALLOC_INCLUDE_DIR}"
    )
endif()

include(FeatureSummary)
set_package_properties(JEMalloc PROPERTIES
    URL "http://www.canonware.com/jemalloc/"
    DESCRIPTION "General-purpose scalable concurrent malloc implementation"
)
