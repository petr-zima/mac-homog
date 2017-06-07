OBJS=amat.o
PREFIX=~/.maxima

MAXIMA=maxima
RM=rm -f
INSTALL=install

%.o: %.mac
	$(MAXIMA) --batch-string=compile_file\(\"$<\"\)\;

all: $(OBJS)

clean:
	$(RM) *.LISP *.UNLISP *.c *.h *.data *.o

install: $(OBJS)
	$(INSTALL) -m 0644 $(OBJS) $(PREFIX)
