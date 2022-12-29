CFLAGS	+= -ansi
LDLIBS	+= -ly -ll
YFLAGS	+= -d

calc: calc.o lexer.o

clean:
	rm -f calc *.o y.tab.h y.output
