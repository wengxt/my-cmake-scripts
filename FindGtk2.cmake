# - Try to find the PANGO_CAIRO libraries
# Once done this will define
#
#  GTK2_FOUND - system has cairo-xlib
#  GTK2_INCLUDE_DIR - the glib2 include directory
#  GTK2_LIBRARIES - glib2 library

# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


if(GTK2_INCLUDE_DIR AND GTK2_LIBRARIES)
    # Already in cache, be silent
    set(GTK2_FIND_QUIETLY TRUE)
endif(GTK2_INCLUDE_DIR AND GTK2_LIBRARIES)

find_package(PkgConfig)
pkg_check_modules(PC_GTK2 QUIET "gtk+-2.0")

_pkgconfig_invoke("gtk+-2.0" PC_GTK2 BINARY_VERSION "" "--variable=gtk_binary_version")
_pkgconfig_invoke("gtk+-2.0" PC_GTK2 LIBDIR "" "--variable=libdir")

find_path(GTK2_INCLUDE_DIR
          NAMES gtk.h
          HINTS ${PC_GTK2_INCLUDE_DIRS}
          PATH_SUFFIXES gtk)

find_library(GTK2_LIBRARY
             NAMES gtk-2.0
             HINTS ${PC_GTK2_LIBRARY_DIRS}
)

set(GTK2_LIBRARIES ${GTK2_LIBRARY})
set(GTK2_BINARY_VERSION ${PC_GTK2_BINARY_VERSEION})
set(GTK2_LIBDIR ${PC_GTK2_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Gtk2 DEFAULT_MSG  GTK2_LIBRARIES GTK2_INCLUDE_DIR PC_GTK2_FOUND GTK2_BINARY_VERSION GTK2_LIBDIR)

mark_as_advanced(GTK2_INCLUDE_DIR GTK2_LIBRARIES GTK2_LIBRARY)
