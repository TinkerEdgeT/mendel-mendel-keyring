aiy-board-keyring.gpg: linux_signing_key.pub
	gpg --no-keyring --import-options import-export --import < $< > $@

build: aiy-board-keyring.gpg

install: build
	install -d $(DESTDIR)/etc/apt/trusted.gpg.d/
	cp aiy-board-keyring.gpg $(DESTDIR)/etc/apt/trusted.gpg.d/

clean:
	rm -f aiy-board-keyring.gpg

.PHONY: build install clean