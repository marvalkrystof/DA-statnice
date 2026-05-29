TEX = main.tex
JOBNAME ?= priprava
BUILDDIR ?= build

.PHONY: all pdf clean

all: pdf

pdf:
	mkdir -p $(BUILDDIR)
	latexmk -xelatex -jobname=$(JOBNAME) -interaction=nonstopmode -halt-on-error -outdir=$(BUILDDIR) $(TEX)

clean:
	latexmk -C -jobname=$(JOBNAME) -outdir=$(BUILDDIR) $(TEX)
