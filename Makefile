CC=gcc
CXX=g++
RANLIB=ranlib

PROGRAMS=usbdump

.PHONY: default
default: $(PROGRAMS)

indent:
	find ./ -name "*.c" -exec indent -i8 -bli8 -bls -br -ts8 -npcs {} \;
	find ./ -name "*.h" -exec indent -i8 -bli8 -bls -br -ts8 -npcs {} \;

OBJECTS_USBDUMP:= usbdump.o

$(PROGRAMS): $(OBJECTS_USBDUMP)
	$(CC) $(CFLAGS) $? -o $@ 

%.o:%.c 
	$(CC) $(CFLAGS) -c $? -o $@ 

clean:
	-rm -rf *~ *.o $(PROGRAMS)
