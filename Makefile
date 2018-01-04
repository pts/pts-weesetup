weesetup.exe: weesetup.c xdio.c utils.c mbr.h
	i686-w64-mingw32-gcc -mconsole -s -Os -W -Wall -Wextra -fno-strict-aliasing -Wno-sign-compare -Wno-pointer-sign -Wl,--gc-sections -ffunction-sections -fdata-sections weesetup.c xdio.c utils.c -o weesetup.exe
mbr.h: wee63.mbr
	perl -0777 -e"s@@<STDIN>@e;print+q+char(wee63_mbr)[]={+;print+map{ord.q+,+}split+q++;print+q+};+" <wee63.mbr >mbr.h
clean:
	rm -f mbr.h weesetup.exe
