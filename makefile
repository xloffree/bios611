.PHONY: clean

clean:
	rm -rf figures
	rm -rf derived_data
  
report.html: report.Rmd
	R -e "rmarkdown::render('report.Rmd', output_format='html_document')"