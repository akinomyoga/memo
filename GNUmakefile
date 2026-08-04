# -*- mode: makefile-gmake -*-

all:
.PHONY: all

all:
	./make.sh

all: out/eqref.pdf
out/eqref.pdf: eqref.tex | out/latex
	latexmk -pdf -outdir=out/latex $<
	cp out/latex/eqref.pdf $@

out/latex:
	mkdir -p $@

