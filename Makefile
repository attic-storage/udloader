VERSION=0.0.1
DIST=dist
DIST_BIN=$(DIST)/bin
DIST_MAN=$(DIST)/share/man
OUTPUT_FOLDER=build
OUTPUT_FILE=udloader-$(VERSION).tar.gz
OUTPUT_PATH=$(OUTPUT_FOLDER)/$(OUTPUT_FILE)

build: build_bin build_manpage
	@mkdir -p $(OUTPUT_FOLDER)
	@cd $(DIST)/ && tar -zcvf ../$(OUTPUT_PATH) .

build_bin: 
	@mkdir -p $(DIST_BIN)
	@rm -rf $(DIST_BIN)/*
	@cp udl* $(DIST_BIN)/

build_manpage: 
	@mkdir -p $(DIST_MAN)
	@rm -rf $(DIST_MAN)/*
	@asciidoctor -d manpage -b manpage -a manversion=$(VERSION) -D $(DIST_MAN)/ MANPAGE.adoc

output_path:
	@echo '$(OUTPUT_PATH)'

output_file:
	@echo '$(OUTPUT_FILE)'

version:
	@echo '$(VERSION)'

devtools:
	@brew bundle

.PHONY: build build_bin build_manpage version
