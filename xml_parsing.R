## XML parsing Code

install.packages('XML')
library(XML)

file_name<-'pubmed_result.xml'
original_text<-xmlTreeParse(file_name,useInternalNodes = T,encoding = 'UTF-8')

# set root node
rootNode<-xmlRoot(original_text)

# get first journal's title
rootNode[[1]][[1]][[3]][[2]]
xmlValue(rootNode[[1]][[1]][[3]][[2]])

for (i in 1:1000){
  title=xmlValue(rootNode[[i]][[1]][[3]][[2]])
  print(title)
}

# relative position differ....try with node name
title<-data.frame(xpathSApply(rootNode,"//ArticleTitle",xmlValue))
head(title)
colnames(title)<-c('title')
