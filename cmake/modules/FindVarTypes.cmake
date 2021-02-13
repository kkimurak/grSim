find_path(
   VarTypes_INCLUDE_DIRS
   NAMES
   vartypes/VarTypes.h
   HINTS
   $ENV{HOME}/include
   /usr/local/include
   /usr/include
   $ENV{ProgramFiles}/vartypes/include
)

find_library(
   VarTypes_LIBRARY
   NAMES
   vartypes
   HINTS
   $ENV{HOME}/lib
   /usr/local/lib
   /usr/lib
   $ENV{ProgramFiles}/vartypes/lib
)

set(VarTypes_LIBRARIES ${VarTypes_LIBRARY})

find_package_handle_standard_args(
   VarTypes
   DEFAULT_MSG
   VarTypes_INCLUDE_DIRS
   VarTypes_LIBRARIES
)

mark_as_advanced(
    VarTypes_INCLUDE_DIRS
    VarTypes_LIBRARIES
    VarTypes_LIBRARY
)

