#!/usr/bin/make -ef

HOST = ftp.domeneshop.no
USER = skihundepensjona
SITE = https://skihundepensjonat.no

DEST = $(USER)@$(HOST):

LINKLINT = linklint -root www
LINKCHECK = linkchecker --check-extern $(SITE)

default: linklint

all: linklint publish linkcheck

publish:
	scp -r www $(DEST) 

links: linklint linkcheck

linklint:
	$(LINKLINT) -no-anchors /@
	$(LINKLINT)/mobil /@
	$(LINKLINT)/pad /@

linkcheck:
	$(LINKCHECK)/
	$(LINKCHECK)/pad
	$(LINKCHECK)/mobil

.PHONY: all default links linklint linkcheck publish
