@echo off

Rem windows batch file to build smokeview from the command line

IF "%SETUP_IFORT_COMPILER_64%"=="1" GOTO envexist

set SETUP_IFORT_COMPILER_64=1

echo Setting up compiler environment
call "%IFORT_COMPILER14%\bin\compilervars" intel64
:envexist

set SMV_TESTFLAG=
set SMV_TESTSTRING=

if "%1" NEQ "-t" goto endif
  set SMV_TESTFLAG=-D pp_BETA
  set SMV_TESTSTRING=test_
:endif

erase *.obj
make -j4 SMV_TESTFLAG="%SMV_TESTFLAG%" SMV_TESTSTRING="%SMV_TESTSTRING%" -f ..\Makefile intel_win_64

