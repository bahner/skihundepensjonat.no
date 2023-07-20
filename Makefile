#!/usr/bin/make -ef

HOST = ftp.domeneshop.no
USER = skihundepensjona
SITE = https://skihundepensjonat.no

DEST = $(USER)@$(HOST):

LINKLINT = linklint -no_anchors -root www


default: linklint publish

publish:
	scp -r www $(DEST) 

links: linklint linkcheck

linklint:
	$(LINKLINT) /@
	$(LINKLINT)/mobil /@
	$(LINKLINT)/pad /@

linkcheck:
	linkchecker --check-extern $(SITE)
	linkchecker --check-extern $(SITE)/pad
	linkchecker --check-extern $(SITE)/mobil
