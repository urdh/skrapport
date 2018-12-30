TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
.PHONY: all clean distclean install dist test clean-test
all: skrapport.tex skrapport.pdf skrapport.cls README
clean: clean-test
	rm -f *.gl? *.id? *.aux # problematic files
	rm -f *.bbl *.bcf *.bib *.blg *.xdy # biblatex
	rm -f *.fls *.log *.out *.run.xml *.toc # junk
distclean: clean
	rm -f *.cls *.sty *.clo *.tar.gz *.tds.zip README
	git reset --hard

%.pdf: %.tex %.cls
	makeglossaries $*
	biber $*
	pdflatex -interaction=nonstopmode -halt-on-error $<
	makeglossaries $*
	pdflatex -interaction=nonstopmode -halt-on-error $<

%.cls: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error $<

%.sty: skrapport.cls

%.clo: skrapport.cls

README: README.md
	sed -e '1,4d;$$d' $< > $@

install: all
	install -m 0644 skrapport-*.sty $(TEXMFHOME)/tex/latex/skrapport/
	install -m 0644 skrapport-*.clo $(TEXMFHOME)/tex/latex/skrapport/
	install -m 0644 skrapport.cls $(TEXMFHOME)/tex/latex/skrapport/skrapport.cls
	install -m 0644 skrapport.pdf $(TEXMFHOME)/doc/latex/skrapport/skrapport.pdf
	install -m 0644 skrapport.tex $(TEXMFHOME)/source/latex/skrapport/skrapport.tex
	install -m 0644 README $(TEXMFHOME)/doc/latex/skrapport/README
	-mktexlsr

skrapport.tds.zip: all
	mkdir -p skrapport/tex/latex/skrapport
	cp skrapport-*.sty skrapport/tex/latex/skrapport/
	cp skrapport-*.clo skrapport/tex/latex/skrapport/
	cp skrapport.cls skrapport/tex/latex/skrapport/skrapport.cls
	mkdir -p skrapport/doc/latex/skrapport
	cp skrapport.pdf skrapport/doc/latex/skrapport/skrapport.pdf
	mkdir -p skrapport/source/latex/skrapport
	cp skrapport.tex skrapport/source/latex/skrapport/skrapport.tex
	cp README skrapport/doc/latex/skrapport/README
	cd skrapport && zip -r ../skrapport.tds.zip *
	rm -rf skrapport

skrapport.tar.gz: all skrapport.tds.zip
	mkdir -p skrapport
	cp skrapport.tex skrapport/skrapport.tex
	cp skrapport.pdf skrapport/skrapport.pdf
	cp README skrapport/README
	cp Makefile skrapport/Makefile
	tar -czf $@ skrapport skrapport.tds.zip
	rm -rf skrapport

dist: skrapport.tar.gz

test:
	cp -f skrapport-*.sty tests/
	cp -f skrapport-*.clo tests/
	$(MAKE) -C tests

clean-test:
	$(MAKE) -C tests clean
	rm -rf tests/skrapport-*.sty
	rm -rf tests/skrapport-*.clo
