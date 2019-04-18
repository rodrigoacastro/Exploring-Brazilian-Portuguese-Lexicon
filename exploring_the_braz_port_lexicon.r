# EXPLORING The Brazilian Portuguese Lexicon: 
# An Instrument for Psycholinguistic Research

# Available at 
# https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0144016#pone.0144016.s002
# https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0144016&type=printable

rm (list = ls())

require(readr)

dir()

#data = read_delim("lexporbr_alfa_zip.txt","\t")
data = read.delim("lexporbr_alfa_zip.txt",sep="\t",encoding="ANSI")

#file = unzip("journal.pone.0144016.s004.ZIP", "lexporbr_alfa_zip.txt")
#data = read.delim(file, sep="\t", encoding="ANSI")


str(data)

str (data$ortografia)

head(data)

# classes gramaticais
unique(data$cat_gram)

# distribution
table(data$cat_gram)
#   adj   adv  gram   nom   num   ver 
# 40537  2938  1144 82097   136 88323 

#verb = subset(data,cat_gram == "ver")
#adverbs = subset(data,cat_gram == "adv")
#nouns = subset(data,cat_gram == "nom")
#numerals = subset(data,cat_gram == "num")
#adjectives = subset(data,cat_gram == "adj")

grammatical_items_df = subset(data,cat_gram == "gram")
grammatical_items_df = as.data.frame (grammatical_items_df)
str(grammatical_items_df)

grammatical_items = grammatical_items_df$ortografia

str(grammatical_items)

edit(grammatical_items)

#################################################