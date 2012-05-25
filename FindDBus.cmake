# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  DBUS_FOUND - system has cairo-xlib
#  DBUS_INCLUDE_DIR - the glib2 include directory
#  DBUS_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(DBUS_INCLUDE_DIR AND DBUS_LIBRARIES)
    # Already in cache, be silent
    set(DBUS_FIND_QUIETLY TRUE)
endif(DBUS_INCLUDE_DIR AND DBUS_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_DBUS QUIET dbus-1)

find_path(DBUS_INCLUDE_DIR
          NAMES dbus.h
          HINTS ${PC_DBUS_INCLUDE_DIRS}
          PATH_SUFFIXES dbus)

find_library(DBUS_LIBRARY
             NAMES dbus-1
             HINTS ${PC_DBUS_LIBRARY_DIRS}
)

set(DBUS_LIBRARIES ${DBUS_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DBus DEFAULT_MSG  DBUS_LIBRARIES DBUS_INCLUDE_DIR)

mark_as_advanced(DBUS_INCLUDE_DIR DBUS_LIBRARIES DBUS_LIBRARY)
