CFLAGS  += -Wall -Wextra -Wno-unused-parameter -pedantic -pipe
CFLAGS  += -std=c99 -D_GNU_SOURCE
CFLAGS  += -Iinclude

all: mkbootimg/mkbootimg mkbootimg/unmkbootimg

mkbootimg/mkbootimg: libmincrypt/sha.o libmincrypt/rsa.o libmincrypt/dsa_sig.o libmincrypt/p256.o libmincrypt/p256_ec.o libmincrypt/p256_ecdsa.o  libmincrypt/sha256.o mkbootimg/mkbootimg.o
	$(CC) -o $@ $^ $(LDFLAGS)

mkbootimg/unmkbootimg: mkbootimg/unmkbootimg.o
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f **/*.o

.PHONY: clean
