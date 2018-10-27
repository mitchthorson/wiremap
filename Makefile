.PHONY: output_data

output_data/ny_merge.tif: output_data/grdn41w075_13.tif output_data/grdn41w074_13.tif
	gdal_merge.py -of GTiff -o $@ $^

output_data/grdn41w075_13.tif: output_data/USGS_NED_13_n41w075_ArcGrid
	gdal_translate -of GTiff src_data/USGS_NED_13_n41w075_ArcGrid/grdn41w075_13 $@

output_data/grdn41w074_13.tif: output_data/USGS_NED_13_n41w074_ArcGrid
	gdal_translate -of GTiff src_data/USGS_NED_13_n41w074_ArcGrid/grdn41w074_13 $@

output_data/USGS_NED_13_n41w075_ArcGrid: output_data/USGS_NED_13_n41w075_ArcGrid.zip
	unzip $< -d $@  

output_data/USGS_NED_13_n41w074_ArcGrid: output_data/USGS_NED_13_n41w074_ArcGrid.zip
	unzip $< -d $@      

output_data/USGS_NED_13_n41w075_ArcGrid.zip: output_data
	curl -o $@ https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/ArcGrid/USGS_NED_13_n41w075_ArcGrid.zip

output_data/USGS_NED_13_n41w074_ArcGrid.zip: output_data
	curl -o $@ https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/ArcGrid/USGS_NED_13_n41w074_ArcGrid.zip

output_data:
	mkdir -p output_data