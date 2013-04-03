TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
.PHONY: all clean distclean install
all: skrapport.pdf
clean:
	rm -f *.cls *.sty
distclean: clean

%.pdf: %.tex
	pdflatex $<
	makeglossaries $*
	biber $*
	pdflatex $<
	makeglossaries $*
	pdflatex $<

%.cls: %.pdf

%.sty: skrapport.cls

install: all
	install -m 0644 skrapport-*.sty $(TEXMFHOME)/tex/latex/skrapport/
	install -m 0644 skrapport.cls $(TEXMFHOME)/tex/latex/skrapport/skrapport.cls
	install -m 0644 skrapport.pdf $(TEXMFHOME)/doc/latex/skrapport/skrapport.pdf
	install -m 0644 skrapport.tex $(TEXMFHOME)/source/latex/skrapport/skrapport.tex
	install -m 0644 README $(TEXMFHOME)/doc/latex/skrapport/README
	-mktexlsr
