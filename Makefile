RIPGREP_VERSION ?= $(shell node -p 'require("./package.json").version')
RIPGREP_BINS = \
	ripgrep-$(RIPGREP_VERSION)-x86_64-apple-darwin/rg \
	ripgrep-$(RIPGREP_VERSION)-x86_64-unknown-linux-musl/rg \

.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -rf ripgrep-*
	rm -rf *SHASUM256.txt

.PHONY: test
test: $(RIPGREP_BINS)
	shasum -c SHASUM256.txt

.PHONY: build
build: clean SHASUM256.txt

SHASUM256.txt: $(RIPGREP_BINS)
	shasum -a 256 $^ > $@

download: $(RIPGREP_BINS)

get-ripgrep = \
	curl -O -L https://github.com/BurntSushi/ripgrep/releases/download/$(*F)/$(@D).tar.gz; \
	tar -xvzf $(@D).tar.gz $(@D)/rg ;\
	rm -rf $(@D).tar.gz ; \

ripgrep-%-x86_64-apple-darwin/rg:
	$(get-ripgrep)

ripgrep-%-x86_64-unknown-linux-musl/rg:
	$(get-ripgrep)
