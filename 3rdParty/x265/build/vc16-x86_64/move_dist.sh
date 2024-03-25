cd $(dirname $0)
cp 8bit/Release/*.dll 8bit/Release/*.lib 8bit/Release/*.exp ../../../dist/lib
cp 8bit/x265_config.h ../../source/x265.h ../../../dist/include