#!/usr/bin/make -ef

HOST = ftp.domeneshop.no
USER = skihundepensjona

DEST = $(USER)@$(HOST):


publish:
	scp -r www $(DEST) 
