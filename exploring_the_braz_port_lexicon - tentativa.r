# EXPLORING The Brazilian Portuguese Lexicon: 
# An Instrument for Psycholinguistic Research

# Available at 
# https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0144016#pone.0144016.s002

rm (list = ls())

require(readr)
require (stringr)

dir()

# read data

# get the file url
today = as.Date(Sys.time())

lexicon_url = 'https://doi.org/10.1371/journal.pone.0144016.s004'

# create a temporary directory
td = tempdir()

# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")
#locFile <- tf

# download into the placeholder file
download.file(lexicon_url, tf)

file_name_pos1 = str_locate(tf,"[CD].*?Rtmpe0vXTe")
# +2 to ignore two slashes (\)
filename1 = substring (tf,file_name_pos1[2]+2, nchar(tf)) 

str_locate(tf,"[CD].*\\\")


# get filename
file_name_pos = str_locate(tf,"file.*?.zip")

filename = substring (tf,file_name_pos[1], file_name_pos[2])

#dir("C:\\Users\\Rodrigo\\AppData\\Local\\Temp\\Rtmpe0vXTe\\")




# get the name of the first file in the zip archive
fname = unzip(tf, list=TRUE)$Name[1]

# unzip the file to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)

# fpath is the full path to the extracted file
fpath = file.path(td, fname)

#data = read_delim("lexporbr_alfa_zip.txt","\t")
file = unz("journal.pone.0144016.s004.ZIP", "lexporbr_alfa_zip.txt")
data = read.delim(file, sep="\t", encoding="ANSI")


# zip file link
# https://doi.org/10.1371/journal.pone.0144016.s004

str(data)

str (data$ortografia)

head(data)

# classes gramaticais
unique(data$cat_gram)

verb = subset(data,cat_gram == "ver")
adverbs = subset(data,cat_gram == "adv")
grammatical_items = subset(data,cat_gram == "gram")
nouns = subset(data,cat_gram == "nom")
numerals = subset(data,cat_gram == "num")
adjectives = subset(data,cat_gram == "adj")

# distribution
table(data$cat_gram)
#   adj   adv  gram   nom   num   ver 
# 40537  2938  1144 82097   136 88323 

#################################################
