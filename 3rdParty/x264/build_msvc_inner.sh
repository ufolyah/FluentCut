cd $(dirname $0)
CC=cl ./configure --enable-static --prefix=./../dist
 
make -j$(getconf _NPROCESSORS_ONLN)
make install
