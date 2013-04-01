.PHONY: all clean distclean
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
