.PHONY: output_data

output_data/ny_crop.tif: output_data/ny_merge.tif
	gdalwarp -te -74.0196973 40.6899 -73.9103 40.8784 $< $@

output_data/ny_merge.tif: output_data/grdn41w075_13.tif output_data/grdn41w074_13.tif
	gdal_merge.py -of Gtiff -o $@ $^

output_data/grdn41w075_13.tif: output_data/USGS_NED_13_n41w075_ArcGrid
	gdal_translate -of Gtiff output_data/USGS_NED_13_n41w075_ArcGrid/grdn41w075_13 $@

output_data/grdn41w074_13.tif: output_data/USGS_NED_13_n41w074_ArcGrid
	gdal_translate -of Gtiff output_data/USGS_NED_13_n41w074_ArcGrid/grdn41w074_13 $@

output_data/USGS_NED_13_n41w075_ArcGrid: output_data/USGS_NED_13_n41w075_ArcGrid.zip
	unzip -o $< -d $@  

output_data/USGS_NED_13_n41w074_ArcGrid: output_data/USGS_NED_13_n41w074_ArcGrid.zip
	unzip -o $< -d $@      

output_data/USGS_NED_13_n41w075_ArcGrid.zip: output_data
	curl -o $@ https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/ArcGrid/USGS_NED_13_n41w075_ArcGrid.zip

output_data/USGS_NED_13_n41w074_ArcGrid.zip: output_data
	curl -o $@ https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/ArcGrid/USGS_NED_13_n41w074_ArcGrid.zip

output_data:
	mkdir -p output_data