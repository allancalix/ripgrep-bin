RIPGREP_VERSION ?= $(shell node -p 'require("./package.json").version')
RIPGREP_BINS = \
	ripgrep-$(RIPGREP_VERSION)-x86_64-apple-darwin/ripgrep \
	ripgrep-$(RIPGREP_VERSION)-x86_64-unknown-linux-musl/ripgrep \

.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -rf ripgrep-*

.PHONY: build
build: clean download

download: $(RIPGREP_BINS)

get-ripgrep = \
	curl -O -L https://github.com/BurntSushi/ripgrep/releases/download/$(*F)/$(@D).tar.gz; \
	tar -xvzf $(@D).tar.gz $(@D)/rg ;\
	rm -rf $(@D).tar.gz ; \

ripgrep-%-x86_64-unknown-linux-musl/ripgrep:
	$(get-ripgrep)

ripgrep-%-x86_64-apple-darwin/ripgrep:
	$(get-ripgrep)
