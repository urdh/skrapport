SOURCES=$(wildcard *.tex)
TESTPDFS=$(SOURCES:.tex=.pdf)
TESTS=$(SOURCES:.tex=.tst)
.PHONY: all test-pdfs test clean
all: test
test-pdfs: $(TESTPDFS)
test: test-pdfs $(TESTS)
clean:
	rm -f *.aux *.log *.out $(TESTPDFS) *.yml

%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error --shell-escape $<
	pdflatex -interaction=nonstopmode -halt-on-error --shell-escape $<

%.tst: %.pdf %.master.pdf
	diff-pdf $^
