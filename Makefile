BUILDDIR=build
PAGEDIR=pages
STATICDIR=static

PAGES=$(shell find $(PAGEDIR) -type f -name \*.md)
STATICS=$(shell find $(STATICDIR) -type f)
PAGES_BUILT=$(patsubst $(PAGEDIR)/%.md,$(BUILDDIR)/%.html,$(PAGES))
STATICS_BUILT=$(patsubst static/%,$(BUILDDIR)/%,$(STATICS))

TEMPLATE=templates/default.html
LUA_FILTERS=pandoc/filters.lua
PANDOC_FROM=markdown+yaml_metadata_block+wikilinks_title_after_pipe
MD_TO_HTML=pandoc --lua-filter=$(LUA_FILTERS) --from=$(PANDOC_FROM)

TOC_MAKER=npx markdown-toc --maxdepth 5 --no-stripHeadingTags --indent="  " --bullets="-" -i
MARP=npx marp --html
MINIFIER=npx minify

DEVNAME=website

.PHONY: all clean test dev stopdev

all: $(BUILDDIR)/blog/index.html $(PAGES_BUILT) $(STATICS_BUILT)

clean:
	rm -rf $(BUILDDIR)/*

$(BUILDDIR)/blog/index.html: blogindex.sh
	@mkdir -p $(@D)
	./blogindex.sh | $(MD_TO_HTML) \
		--template=$(TEMPLATE) \
		-o $@
	$(MINIFIER) $@ | sponge $@

$(BUILDDIR)/slides/%.html: $(PAGEDIR)/slides/%.md
	@mkdir -p $(@D)
	$(MARP) $< -o $@
	$(MINIFIER) $@ | sponge $@

$(BUILDDIR)/%.html: $(PAGEDIR)/%.md $(TEMPLATE)
	@mkdir -p $(@D)
	$(TOC_MAKER) $<
	$(MD_TO_HTML) \
		--template=$(TEMPLATE) \
		--metadata="directory:$(subst pages/,,$<)" \
		-o $@ $<
	$(MINIFIER) $@ | sponge $@

$(BUILDDIR)/%: $(STATICDIR)/%
	@mkdir -p $(@D)
	cp -r $< $@

$(BUILDDIR)/%.css: $(STATICDIR)/%.css
	@mkdir -p $(@D)
	cp -r $< $@
	$(MINIFIER) $@ | sponge $@

$(BUILDDIR)/%.js: $(STATICDIR)/%.js
	@mkdir -p $(@D)
	cp -r $< $@
	$(MINIFIER) $@ | sponge $@

test: build/style.css build/test.html build/index.html

dev: stopdev
	screen -S $(DEVNAME) -d -m python3 -m http.server -d $(BUILDDIR)

stopdev:
	screen -S $(DEVNAME) -X quit | true
