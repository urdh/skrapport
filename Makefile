TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
.PHONY: all clean distclean install dist
all: skrapport.pdf
clean:
	rm -f *.gl? *.id? *.aux # problematic files
	rm -f *.bbl *.bcf *.bib *.blg *.xdy # biblatex
	rm -f *.fls *.log *.out *.run.xml *.toc # junk
distclean: clean
	rm -f *.cls *.sty *.clo *.tar.gz *.tds.zip
	git reset --hard

%.pdf: %.tex %.cls
	makeglossaries $*
	biber $*
	pdflatex $<
	makeglossaries $*
	pdflatex $<

%.cls: %.tex
	pdflatex $<

%.sty: skrapport.cls

%.clo: skrapport.cls

install: all
	install -m 0644 skrapport-*.sty $(TEXMFHOME)/tex/latex/skrapport/
	install -m 0644 skrapport-*.clo $(TEXMFHOME)/tex/latex/skrapport/
	install -m 0644 skrapport.cls $(TEXMFHOME)/tex/latex/skrapport/skrapport.cls
	install -m 0644 skrapport.pdf $(TEXMFHOME)/doc/latex/skrapport/skrapport.pdf
	install -m 0644 skrapport.tex $(TEXMFHOME)/source/latex/skrapport/skrapport.tex
	install -m 0644 README $(TEXMFHOME)/doc/latex/skrapport/README
	-mktexlsr

skrapport.tds.zip: skrapport.tex skrapport.pdf skrapport.cls
	mkdir -p skrapport/{tex,doc,source}/latex/skrapport
	cp skrapport-*.sty skrapport/tex/latex/skrapport/
	cp skrapport-*.clo skrapport/tex/latex/skrapport/
	cp skrapport.cls skrapport/tex/latex/skrapport/skrapport.cls
	cp skrapport.pdf skrapport/doc/latex/skrapport/skrapport.pdf
	cp skrapport.tex skrapport/source/latex/skrapport/skrapport.tex
	cp README skrapport/doc/latex/skrapport/README
	cd skrapport && zip -r ../skrapport.tds.zip *
	rm -rf skrapport

skrapport.tar.gz: skrapport.tds.zip skrapport.tex skrapport.pdf
	mkdir -p skrapport
	cp skrapport.tex skrapport/skrapport.tex
	cp skrapport.pdf skrapport/skrapport.pdf
	cp README skrapport/README
	cp Makefile skrapport/Makefile
	tar -czf $@ skrapport skrapport.tds.zip
	rm -rf skrapport

dist: skrapport.tar.gz
