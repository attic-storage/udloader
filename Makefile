VERSION=0.0.2
DIST=dist
DIST_BIN=$(DIST)/bin
DIST_MAN=$(DIST)/share/man
OUTPUT_FOLDER=build
OUTPUT_FILE=udloader-$(VERSION).tar.gz
OUTPUT_PATH=$(OUTPUT_FOLDER)/$(OUTPUT_FILE)

build: clean build_bin build_manpage
	@mkdir -p $(OUTPUT_FOLDER)
	@cd $(DIST)/ && tar -zcf ../$(OUTPUT_PATH) .

build_bin: 
	@mkdir -p $(DIST_BIN)
	@rm -rf $(DIST_BIN)/*
	@cp udl* $(DIST_BIN)/

build_manpage: 
	@mkdir -p $(DIST_MAN)
	@rm -rf $(DIST_MAN)/*
	@asciidoctor -d manpage -b manpage -a manversion=$(VERSION) -D $(DIST_MAN)/ MANPAGE.adoc

clean:
	@rm -rf $(DIST_BIN)
	@rm -rf $(OUTPUT_FOLDER)

output_path:
	@echo '$(OUTPUT_PATH)'

output_file:
	@echo '$(OUTPUT_FILE)'

version:
	@echo '$(VERSION)'

devtools:
	@brew bundle

.PHONY: build build_bin build_manpage clean output_path output_file version devtools
