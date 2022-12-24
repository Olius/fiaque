CFLAGS	+= -ansi
LDLIBS	+= -ly -ll
YFLAGS	+= -d

calc: calc.o lexer.o

clean:
	rm -f calc y.tab.h *.o
