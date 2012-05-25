# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  GIO2_FOUND - system has cairo-xlib
#  GIO2_INCLUDE_DIR - the glib2 include directory
#  GIO2_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(GIO2_INCLUDE_DIR AND GIO2_LIBRARIES)
    # Already in cache, be silent
    set(GIO2_FIND_QUIETLY TRUE)
endif(GIO2_INCLUDE_DIR AND GIO2_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_GIO2 QUIET "gio-2.0 >= 2.26")

find_path(GIO2_INCLUDE_DIR
          NAMES gio.h
          HINTS ${PC_GIO2_INCLUDE_DIRS}
          PATH_SUFFIXES gio)

find_library(GIO2_LIBRARY
             NAMES gio-2.0
             HINTS ${PC_GIO2_LIBRARY_DIRS}
)

set(GIO2_LIBRARIES ${GIO2_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Gio2 DEFAULT_MSG  GIO2_LIBRARIES GIO2_INCLUDE_DIR PC_GIO2_FOUND)

mark_as_advanced(GIO2_INCLUDE_DIR GIO2_LIBRARIES GIO2_LIBRARY)
