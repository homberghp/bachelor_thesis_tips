# Makefile for LaTeX.
.SUFFIXES=
.SUFFIXES=.tex .pdf

LATEX=pdflatex -recorder -output-directory=out -synctex 15 -shell-escape
BIBTEX=biber --output-directory=out --input-directory=out
DEPENDENCIES=partials/* configuration/*.tex chapters/*.tex images/*.pdf images/*.pdf images/*.jpg appendix/* ./*.png tables/*.*

all: main.pdf

fast: fast.pdf

main.pdf: main.tex out $(DEPENDENCIES)
	$(LATEX) main.tex
	$(LATEX) main.tex
	$(BIBTEX) main
	makeglossaries -d out main
	$(LATEX) main.tex
	$(LATEX) main.tex
	ln -sf out/*.pdf .

fast.pdf: main.tex out $(DEPENDENCIES)
	$(LATEX) main.tex
	ln -sf out/*.pdf fast.pdf

out:
	mkdir -p out/chapters out/partials out/appendix

clean:
	rm -fr out *.aux *.log *.synctex *.bbl *.lof *.toc *.out *.bcf *.blg
	rm -f main.pdf
