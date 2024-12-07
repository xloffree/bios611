.PHONY: clean

clean:
	rm -f match_data_clean.csv
	rm -f match_data_team.csv
	rm -f avg_team_data.csv
	rm -f foul_map.png
	rm -f avg_team_data_kmeans.csv 
	rm -f scree.png
	rm -f cluster_summary.csv
	rm -f avg_team_data_cont.csv
	rm -f continent_confusion.csv
	rm -f avg_team_data_rank.csv
	rm -f rank_conf.csv
	rm -f cluster_map.png
	rm -f train_data.csv
	rm -f test_data.csv
	rm -f mlr_conf.csv
	rm -f en_conf.csv
	rm -f coef_df.csv
	rm -f pfi_df.csv
	rm -f pfi_plot.png
	rm -f xgb_df.csv
	rm -f xgb_pred.csv
	rm -f xgb_imp.csv
	rm -f xgb_imp.png
	rm -f xgb_train_x.csv 
	rm -f xgb_test_x.csv 
	rm -f xgb_train_y.csv 
	rm -f xgb_test_y.csv
	rm -f xgb_train.csv
	rm -f xgb_test.csv
	rm -f lin_pred.csv
	
match_data_clean.csv: clean_data1.Rmd Fifa_world_cup_matches.csv
	Rscript -e "rmarkdown::render('clean_data1.Rmd', output_format='pdf_document')"
	
match_data_team.csv avg_team_data.csv: match_data_country2.Rmd country-capital-lat-long-population.csv match_data_clean.csv
	Rscript -e "rmarkdown::render('match_data_country2.Rmd', output_format='pdf_document')"
	
pos_plot.png: pos_plot3.Rmd match_data_clean.csv
	Rscript -e "rmarkdown::render('pos_plot3.Rmd', output_format='pdf_document')"
	
foul_map.png: foul_map4.Rmd avg_team_data.csv
	Rscript -e "rmarkdown::render('foul_map4.Rmd', output_format='pdf_document')"
	
avg_team_data_kmeans.csv scree.png: kmeans5.Rmd avg_team_data.csv
	Rscript -e "rmarkdown::render('kmeans5.Rmd', output_format='pdf_document')"
	
cluster_summary.csv: cluster_summary6.Rmd avg_team_data_kmeans.csv
	Rscript -e "rmarkdown::render('cluster_summary6.Rmd', output_format='pdf_document')"
	
avg_team_data_cont.csv: cont_data7.Rmd avg_team_data_kmeans.csv
	Rscript -e "rmarkdown::render('cont_data7.Rmd', output_format='pdf_document')"
	
continent_confusion.csv: cont_conf8.Rmd avg_team_data_cont.csv
	Rscript -e "rmarkdown::render('cont_conf8.Rmd', output_format='pdf_document')"
	
avg_team_data_rank.csv: rank_data9.Rmd avg_team_data_cont.csv
	Rscript -e "rmarkdown::render('rank_data9.Rmd', output_format='pdf_document')"
	
rank_conf.csv: rank_conf10.Rmd avg_team_data_rank.csv
	Rscript -e "rmarkdown::render('rank_conf10.Rmd', output_format='pdf_document')"	

cluster_map.png: cluster_map11.Rmd avg_team_data_rank.csv
	Rscript -e "rmarkdown::render('cluster_map11.Rmd', output_format='pdf_document')"	
	
train_data.csv test_data.csv: train_test_split12.Rmd match_data_team.csv
	Rscript -e "rmarkdown::render('train_test_split12.Rmd', output_format='pdf_document')"
	
mlr_conf.csv: mlr13.Rmd test_data.csv train_data.csv
	Rscript -e "rmarkdown::render('mlr13.Rmd', output_format='pdf_document')"

en_conf.csv coef_df.csv pfi_df.csv: en14.Rmd test_data.csv train_data.csv
	Rscript -e "rmarkdown::render('en14.Rmd', output_format='pdf_document')"
	
coef_plot.png coef_df.csv: coef_plot15.Rmd coef_df.csv
	Rscript -e "rmarkdown::render('coef_plot15.Rmd', output_format='pdf_document')"

pfi_plot.png: pfi_plot16.Rmd pfi_df.csv
	Rscript -e "rmarkdown::render('pfi_plot16.Rmd', output_format='pdf_document')"
	
xgb_df.csv: xgb_df17.Rmd match_data_clean.csv
	Rscript -e "rmarkdown::render('xgb_df17.Rmd', output_format='pdf_document')"
	
xgb_train_x.csv xgb_test_x.csv xgb_train_y.csv xgb_test_y.csv xgb_train.csv xgb_test.csv: xgb_split18.Rmd xgb_df.csv
	Rscript -e "rmarkdown::render('xgb_split18.Rmd', output_format='pdf_document')"
	
xgb_pred.csv xgb_imp.csv: xgb19.Rmd xgb_train_x.csv xgb_test_x.csv xgb_train_y.csv xgb_test_y.csv
	Rscript -e "rmarkdown::render('xgb19.Rmd', output_format='pdf_document')"
	
xgb_imp.png: xgb_imp20.Rmd xgb_imp.csv
	Rscript -e "rmarkdown::render('xgb_imp20.Rmd', output_format='pdf_document')"
	
lin_pred.csv: linreg21.Rmd xgb_train.csv xgb_test.csv xgb_test_y.csv
	Rscript -e "rmarkdown::render('linreg21.Rmd', output_format='pdf_document')"
	