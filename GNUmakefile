# -*- mode: makefile-gmake -*-

all:
.PHONY: all

all:
	./make.sh

all: out/eqref.pdf
out/eqref.pdf: eqref.tex dcancel.sty | out/latex
	latexmk -pdf -outdir=out/latex -deps-out=out/latex/eqref.dep $<
	cp out/latex/eqref.pdf $@

out/latex:
	mkdir -p $@

