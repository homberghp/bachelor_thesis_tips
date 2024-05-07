# Makefile for LaTeX.
# for use with xelatexd
LATEX=./latexw
BIBTEX=./bibtexw
## for use with default latex
LATEX=pdflatex -recorder -output-directory=out -synctex 15 -shell-escape -interaction=batchmode
BIBTEX=biber --output-directory=out --input-directory=out
# if you want to use xelatexd comment the two lines above this one.
DEPENDENCIES=partials/* configuration/*.tex chapters/*.tex images/*.pdf images/*.pdf images/*.jpg appendix/* ./*.png tables/*.*
## if you use xelatex for better font and utf-8 handling replace latexw and pdflatex with xelatexw and xelatex.
all: main.pdf
fast: fast.pdf

main.pdf: main.tex out $(DEPENDENCIES)
	$(LATEX) main.tex
	$(LATEX) main.tex
	$(BIBTEX) main
	$(LATEX) main.tex
	$(LATEX) main.tex
	ln -sf out/*.pdf .

fast.pdf: main.tex out $(DEPENDENCIES)
	$(LATEX) main.tex
	ln -sf out/*.pdf

out:
	mkdir -p out/chapters out/partials out/appendix

clean:
	rm -fr out *.aux *.log *.synctex *.bbl *.lof *.toc *.out *.bcf *.blg
	rm -f main.pdf
