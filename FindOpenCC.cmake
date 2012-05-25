# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  OPENCC_FOUND - system has cairo-xlib
#  OPENCC_INCLUDE_DIR - the glib2 include directory
#  OPENCC_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(OPENCC_INCLUDE_DIR AND OPENCC_LIBRARIES)
    # Already in cache, be silent
    set(OPENCC_FIND_QUIETLY TRUE)
endif(OPENCC_INCLUDE_DIR AND OPENCC_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_OPENCC QUIET opencc)

find_path(OPENCC_INCLUDE_DIR
          NAMES opencc.h
          HINTS ${PC_OPENCC_INCLUDE_DIRS}
          PATH_SUFFIXES opencc)

find_library(OPENCC_LIBRARY
             NAMES opencc
             HINTS ${PC_OPENCC_LIBRARY_DIRS}
)

set(OPENCC_LIBRARIES ${OPENCC_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenCC DEFAULT_MSG  OPENCC_LIBRARIES OPENCC_INCLUDE_DIR)

mark_as_advanced(OPENCC_INCLUDE_DIR OPENCC_LIBRARIES OPENCC_LIBRARY)
