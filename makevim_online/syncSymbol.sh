#!/bin/sh
ctags  -f ./.tags -R --c++-kinds=+p --fields=+iaS --extra=+q
find . -name "*.h" -o -name "*.c" -o -name "*.cc"  -o -name "*.cpp" > cscope.files
cscope -bkq -i cscope.files
