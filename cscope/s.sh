#!/bin/bash
find ~/projects/ -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.hpp' > cscope.filelist
cscope -bq -i cscope.filelist
ctags -L cscope.filelist
