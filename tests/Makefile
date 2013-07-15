SOURCES=$(wildcard *.tex)
TESTS=$(SOURCES:.tex=.pdf)
.PHONY: all test clean
all: test
test: $(TESTS)
clean:
	rm -f *.aux *.log *.out *.pdf *.yml

%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error --shell-escape $<
	pdflatex -interaction=nonstopmode -halt-on-error --shell-escape $<
