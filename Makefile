OBJS=amat.o homkil.mac
PREFIX=~/.maxima

MAXIMA=maxima
RM=rm -f
INSTALL=install

%.o: %.mac
	$(MAXIMA) --init= --batch-string=compile_file\(\"$<\"\)\;

all: $(OBJS)

clean:
	$(RM) *.LISP *.UNLISP *.c *.h *.data *.o

install: $(OBJS)
	$(INSTALL) -m 0644 $(OBJS) $(PREFIX)
