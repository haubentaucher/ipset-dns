CFLAGS ?= -ggdb3 -lc -v
ifeq ($(OLD_IPSET),1)
	CFLAGS += -DOLD_IPSET
else
	CFLAGS += -lmnl
endif

.PHONY: clean

ipset-dns: ipset-dns.o
	$(CC) -o $@ $< $(CFLAGS)
	
.c.o:
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -f ipset-dns.o ipset-dns
