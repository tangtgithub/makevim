#!/bin/sh
rm -rf tags cscope*
#ctags  -f ./.tags -R --c++-kinds=+p --fields=+iaS --extra=+q
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
find . -name "*.h" -o -name "*.c" -o -name "*.cc"  -o -name "*.cpp" -o -name "*.hpp"> cscope.files
cscope -bkq -i cscope.files
