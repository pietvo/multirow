.PHONY: all clean dist
all: multirow.sty bigstrut.sty bigdelim.sty multirow.pdf README

multirow.sty bigstrut.sty bigdelim.sty : multirow.dtx multirow.ins
	tex multirow.ins

multirow.pdf: multirow.dtx multirow.sty bigstrut.sty bigdelim.sty
	rm -f multirow.ind
	latexmk multirow.dtx

README: README.tpl multirow.dtx
	version=`grep 'multirow|bigstrut|bigdelim> *\[201' multirow.dtx | sed 's/.*\[//'`; \
	sed "s@#VERSION@$$version@g" README.TPL > README

clean:
	rm -f *.aux *.log *.idx *.ind *.ilg *.fdb_latexmk *.fls *.glo *.gls *~ *.rel *.toc *.synctex.gz

dist: multirow.zip
distfiles = README multirow.dtx multirow.ins multirow.pdf
multirow.zip: $(distfiles)
	cd .. ; zip -u multirow/multirow.zip $(addprefix multirow/,$(distfiles))
