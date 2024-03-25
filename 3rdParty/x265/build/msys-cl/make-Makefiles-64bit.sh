#!/bin/sh
# This is to generate visual studio builds with required environment variables set in this shell, useful for ffmpeg integration
# Run this from within an MSYS bash shell

target_processor='amd64'
path=$(which cl)

cmake -G "NMake Makefiles" -DCMAKE_CXX_FLAGS="-DWIN32 -D_WINDOWS -W4 -GR -EHsc" -DCMAKE_C_FLAGS="-DWIN32 -D_WINDOWS -W4"  ../../source
if [ -e Makefile ]
then
    nmake
fi