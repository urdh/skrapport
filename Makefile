.PHONY: all clean distclean
all: skrapport.pdf
clean:
	rm -f *.cls *.sty
distclean: clean

%.pdf:
	pdflatex $*.tex
	makeglossaries $*
	pdflatex $*.tex
	makeglossaries $*
	pdflatex $*.tex

%.cls: $*.pdf

%.sty: skrapport.cls
