all: skiplist.so

skiplist.so: skiplist.h skiplist.c lua-skiplist.c
	gcc -g3 -O0 -Wall -fPIC --shared -L/usr/local/lib/lua/luajit -lluajit $^ -o $@ 

test:
	lua test_sl.lua

clean:
	-rm skiplist.so
