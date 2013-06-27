#! /usr/bin/make -f
COMPIL	= ./out
SRC		= .
PDF		= pdflatex -output-directory ${COMPIL} $<
TEX		= $(shell find ${SRC} -iname "*.tex")
OTARGET	= $(patsubst %.tex, %.pdf, $(wildcard main.tex*) ${SRC}/$(WIldcard ${SRC}/main.*.tex))
TARGET	= $(patsubst %.tex, %.pdf, $(shell find . -iregex "\./main\.*.*\.tex"))
DIR		= ${COMPIL}
.SUFFIXES:
.PHONY: all clean mrpropre svnignore test

all: ${TARGET}

%.pdf : %.tex ${TEX} ${DIR} Makefile
	@${PDF} && ${PDF}

clean:
	find ${SRC} -iregex ".*\.\(dvi\|log\|nav\|out\|ps\|snm\|toc\|aux\|cb\|tns\|bbl\|blg\|url\)$$" -delete

mrpropre: 
	rm -rf ${COMPIL} 

${DIR}:
	mkdir -p "$@"

svnignore:
	svn propset svn:ignore \
		"$$(/bin/echo -ne '*.aux\n*.bb\n*.dvi\n*.log\n*.nav\n*.out\n*.pdf\n*.ps\n*.snm\n*.tmp\n*.toc\n*.vrb\n*.swp\n*.*~\nout')" .

test:
	@echo "Compil : ${COMPIL}"
	@echo "SRC ${SRC}"
	@echo "Tex ${TEX}"
	@echo "Target ${TARGET}"
	@echo "Dir ${DIR}"

