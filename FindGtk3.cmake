# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  GTK3_FOUND - system has cairo-xlib
#  GTK3_INCLUDE_DIR - the glib3 include directory
#  GTK3_LIBRARIES - glib3 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(GTK3_INCLUDE_DIR AND GTK3_LIBRARIES)
    # Already in cache, be silent
    set(GTK3_FIND_QUIETLY TRUE)
endif(GTK3_INCLUDE_DIR AND GTK3_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_GTK3 QUIET "gtk+-3.0")

_pkgconfig_invoke("gtk+-3.0" PC_GTK3 BINARY_VERSION "" "--variable=gtk_binary_version")
_pkgconfig_invoke("gtk+-3.0" PC_GTK3 LIBDIR "" "--variable=libdir")

find_path(GTK3_INCLUDE_DIR
          NAMES gtk.h
          HINTS ${PC_GTK3_INCLUDE_DIRS}
          PATH_SUFFIXES gtk)

find_library(GTK3_LIBRARY
             NAMES gtk-3.0
             HINTS ${PC_GTK3_LIBRARY_DIRS}
)

set(GTK3_LIBRARIES ${GTK3_LIBRARY})
set(GTK3_BINARY_VERSION ${PC_GTK3_BINARY_VERSEION})
set(GTK3_LIBDIR ${PC_GTK3_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Gio3 DEFAULT_MSG  GTK3_LIBRARIES GTK3_INCLUDE_DIR PC_GTK3_FOUND GTK3_BINARY_VERSION GTK3_LIBDIR)

mark_as_advanced(GTK3_INCLUDE_DIR GTK3_LIBRARIES GTK3_LIBRARY)
