#
# Usage:
#   nmake /f dir.mk [<build option>]
#
#  <build option>:
#      all       - build all executables
#      clean     - delete all executables and obj files
#      veryclean - clean plus delete all stub files generated by omniidl2
#        
#
# Pre-requisite:
#
# Make sure that you have environment variable LIB and INCLUDE setup for
# using Developer studio from the command line. Usually, this is accomplished
# by source the vcvars32.bat file.
#

# Where is the top of this distribution. All executable, library and include
# directories are relative to this variable.
#
TOP = ..\..\..


##########################################################################
# Essential flags to use omnithread
#
DIR_CPPFLAGS   = -I. -I$(TOP)\include
#
#
THREAD_CPPFLAGS = -D__WIN32__ -D__x86__ -D__NT__ -D__OSVERSION__=4
THREAD_LIB      = omnithread_rt.lib -libpath:$(TOP)\lib\x86_win32
CXXFLAGS       = -O2 -MD -GX $(THREAD_CPPFLAGS) $(DIR_CPPFLAGS)
CXXLINKOPTIONS =

.SUFFIXES: .cc
.cc.obj:
  cl /nologo /c $(CXXFLAGS) /Tp$<

########################################################################
# To build debug executables
# Replace the above with the following:
#
#THREAD_CPPFLAGS = -D__WIN32__ -D__x86__ -D__NT__ -D__OSVERSION__=4
#THREAD_LIB      = omnithread30_rtd.lib -libpath:$(TOP)\lib\x86_win32
#CXXFLAGS       = -MDd -GX -Z7 -Od  $(THREAD_CPPFLAGS) $(DIR_CPPFLAGS)
#CXXLINKOPTIONS = -debug -PDB:NONE	

all:: diner.exe prio.exe thrspecdata.exe prodcons.exe

diner.exe: diner.obj
  link -nologo $(CXXLINKOPTIONS) -out:$@ $** $(THREAD_LIB) 

prio.exe: prio.obj
  link -nologo $(CXXLINKOPTIONS) -out:$@ $** $(THREAD_LIB)

thrspecdata.exe: thrspecdata.obj
  link -nologo $(CXXLINKOPTIONS) -out:$@ $** $(THREAD_LIB)

prodcons.exe: prodcons.obj
  link -nologo $(CXXLINKOPTIONS) -out:$@ $** $(THREAD_LIB)


clean::
  -del *.obj
  -del *.exe


veryclean::
  -del *.obj
  -del *.exe

