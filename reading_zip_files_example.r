# Reading zip files in R without unziping

# https://hydroecology.net/downloading-extracting-and-reading-files-in-r/

rm(list=ls())

# get the file url
today = as.Date(Sys.time())
forecasturl = paste('http://www.cnrfc.noaa.gov/csv/', 
                    gsub('-', '', today),
                    '12_CentralCoast_hefs_csv_daily.zip', sep='')

# create a temporary directory
td = tempdir()

# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")

# download into the placeholder file
download.file(forecasturl, tf)


# get the name of the first file in the zip archive
fname = unzip(tf, list=TRUE)$Name[1]

# unzip the file to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname)


# stringsAsFactors=TRUE will screw up conversion to numeric!
d = read.csv(fpath, header=TRUE, row.names=NULL, 
             stringsAsFactors=FALSE)

# drop 1st row (second header row)
forecast = d[seq(2, nrow(d)), ]

# first column is date, column name is 'GMT'
forecast[, 'GMT'] = as.Date(substr(forecast$GMT, 1, 10))

# all other columns are numeric
flowcols = seq(2, ncol(forecast)) 
forecast[, flowcols] = as.numeric(as.matrix(forecast[, flowcols]))