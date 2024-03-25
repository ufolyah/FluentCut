cd $(dirname $0)
rm -rf build
mkdir -p build
cd build
cmake -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX:PATH=../dist .. 
cmake --build . --target INSTALL --config Release
cmake -E copy_directory ../dist ../../dist
