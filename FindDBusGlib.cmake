# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  DBUSGLIB_FOUND - system has cairo-xlib
#  DBUSGLIB_INCLUDE_DIR - the glib2 include directory
#  DBUSGLIB_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(DBUSGLIB_INCLUDE_DIR AND DBUSGLIB_LIBRARIES)
    # Already in cache, be silent
    set(DBUSGLIB_FIND_QUIETLY TRUE)
endif(DBUSGLIB_INCLUDE_DIR AND DBUSGLIB_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_DBUSGLIB QUIET dbus-glib-1)

find_path(DBUSGLIB_INCLUDE_DIR
          NAMES dbus-glib.h
          HINTS ${PC_DBUSGLIB_INCLUDE_DIRS}
          PATH_SUFFIXES dbus)

find_library(DBUSGLIB_LIBRARY
             NAMES dbus-glib-1
             HINTS ${PC_DBUSGLIB_LIBRARY_DIRS}
)

set(DBUSGLIB_LIBRARIES ${DBUSGLIB_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FontConfig DEFAULT_MSG  DBUSGLIB_LIBRARIES DBUSGLIB_INCLUDE_DIR)

mark_as_advanced(DBUSGLIB_INCLUDE_DIR DBUSGLIB_LIBRARIES DBUSGLIB_LIBRARY)
