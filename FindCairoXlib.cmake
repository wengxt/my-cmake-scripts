# - Try to find the CAIROXLIB libraries
# Once done this will define
#
#  CAIROXLIB_FOUND - system has cairo-xlib
#  CAIROXLIB_INCLUDE_DIR - the glib2 include directory
#  CAIROXLIB_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(CAIROXLIB_INCLUDE_DIR AND CAIROXLIB_LIBRARIES)
    # Already in cache, be silent
    set(CAIROXLIB_FIND_QUIETLY TRUE)
endif(CAIROXLIB_INCLUDE_DIR AND CAIROXLIB_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_CAIROXLIB QUIET cairo-xlib)

find_path(CAIROXLIB_INCLUDE_DIR
          NAMES cairo-xlib.h
          HINTS ${PC_CAIROXLIB_INCLUDE_DIRS}
          PATH_SUFFIXES cairo)

find_library(CAIROXLIB_LIBRARY
             NAMES cairo
             HINTS ${PC_CAIROXLIB_LIBRARY_DIRS}
)

set(CAIROXLIB_LIBRARIES ${CAIROXLIB_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CairoXlib DEFAULT_MSG CAIROXLIB_LIBRARIES CAIROXLIB_INCLUDE_DIR)

mark_as_advanced(CAIROXLIB_INCLUDE_DIR CAIROXLIB_LIBRARIES CAIROXLIB_LIBRARY)
