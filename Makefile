HOMOG_SRCS=homkil.mac
OBJS=amat.o homog.mac
PREFIX=~/.maxima

MAXIMA=maxima
RM=rm -f
INSTALL=install
CAT=cat

all: $(OBJS)

homog.mac: $(HOMOG_SRCS)
	$(CAT) $(HOMOG_SRCS) > $@

%.o: %.mac
	$(MAXIMA) --init= --batch-string=compile_file\(\"$<\"\)\;

clean:
	$(RM) *.LISP *.UNLISP *.c *.h *.data *.o homog.mac

install: $(OBJS)
	$(INSTALL) -m 0644 $(OBJS) $(PREFIX)
