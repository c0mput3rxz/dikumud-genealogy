# Makefile for Solaris 2.1 on a Sparc 10 with gcc.
# Changes contributed by Torsten Spindler.

CC      = gcc
PROF    =
DEBUG   =
NOCRYPT =
O_FLAGS = -O
C_FLAGS = $(O_FLAGS) -Wall $(DEBUG) $(PROF) $(NOCRYPT)
L_FLAGS =                  $(DEBUG) $(PROF) -lelf -lucb -lsocket -lnsl

O_FILES = act_comm.o act_info.o act_move.o act_obj.o act_wiz.o comm.o const.o \
          db.o fight.o handler.o interp.o magic.o save.o special.o update.o

envy: $(O_FILES)
	rm -f envy
	$(CC) $(L_FLAGS) -o envy $(O_FILES)

.c.o: merc.h
	$(CC) -c $(C_FLAGS) $<
