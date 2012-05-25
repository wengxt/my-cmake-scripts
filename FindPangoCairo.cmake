# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  PANGOCAIRO_FOUND - system has cairo-xlib
#  PANGOCAIRO_INCLUDE_DIR - the glib2 include directory
#  PANGOCAIRO_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(PANGOCAIRO_INCLUDE_DIR AND PANGOCAIRO_LIBRARIES)
    # Already in cache, be silent
    set(PANGOCAIRO_FIND_QUIETLY TRUE)
endif(PANGOCAIRO_INCLUDE_DIR AND PANGOCAIRO_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_PANGOCAIRO QUIET pangocairo)

find_path(PANGOCAIRO_INCLUDE_DIR
          NAMES pangocairo.h
          HINTS ${PC_PANGOCAIRO_INCLUDE_DIRS}
          PATH_SUFFIXES pango)

find_library(PANGOCAIRO_LIBRARY
             NAMES pangocairo-1.0
             HINTS ${PC_PANGOCAIRO_LIBRARY_DIRS}
)

set(PANGOCAIRO_LIBRARIES ${PANGOCAIRO_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PangoCairo DEFAULT_MSG  PANGOCAIRO_LIBRARIES PANGOCAIRO_INCLUDE_DIR)

mark_as_advanced(PANGOCAIRO_INCLUDE_DIR PANGOCAIRO_LIBRARIES PANGOCAIRO_LIBRARY)
