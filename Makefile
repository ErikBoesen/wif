exec = wif
DESTDIR = /usr/local/bin

install:
	install -m 0755 $(exec) $(DESTDIR)

link:
	ln -s $(realpath $(exec)) $(DESTDIR)

uninstall:
	rm $(dest)/$(exec)
