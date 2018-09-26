EXEC = wif
DESTDIR = /usr/local/bin

install:
	install -m 0755 $(EXEC) $(DESTDIR)

link:
	ln -s $(realpath $(EXEC)) $(DESTDIR)

uninstall:
	rm $(DESTDIR)/$(EXEC)
