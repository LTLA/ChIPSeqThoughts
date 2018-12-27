REPORTS = ./index.html peak_selection/peak_selection.html nonstandard_fdr/nonstandard_fdr.html lowcount_norm/lowcount_norm.html subtract_control/subtract_control.html

all: $(REPORTS)

$(REPORTS): %.html: %.Rmd
	cd $(shell dirname $<) && R --no-save --slave -e 'rmarkdown::render(basename("$<"))' 
 
clean:
	rm -f $(REPORTS)
