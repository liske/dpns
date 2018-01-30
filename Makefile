DESTDIR:=

all:
	

install:
	pwd
	mkdir -p "$(DESTDIR)/usr/sbin"
	cp src/dpns-* "$(DESTDIR)/usr/sbin/"
	mkdir -p "$(DESTDIR)/etc/dpns"
	cp conf/*.conf "$(DESTDIR)/etc/dpns/"
