# graveyarded chunks from bitterEmpireScrape.r
# first we'll just do a test/simple pull of tags/data from the summary page of my own posts
#Specify the url for desired website to be scraped
url <- 'http://bitterempire.com/author/tara-jenson/'
webpage <- read_html(url)

# data to scrape: title (entry-title), datetime (.entry-time), author (entry-author-name), 
# tagged with (entry-tags), filed under (entry-categories), comments, content/text (entry-content)
# use SelectorGadget to get the specific CSS selectors that encloses the element you want

PostNum <- 1:10
bitterempire <- data.frame(matrix(ncol=1,nrow=10))
x <- "postnum"
colnames(bitterempire) <- x
for(i in 1:10) { 
  bitterempire$postnum[i] <- i
}
### date pull first
datetime_data_html <- html_nodes(webpage,'.entry-time')
datetime_data <- html_text(datetime_data_html) #Converting the datetime data to text
head(datetime_data)
AsDate("February 29, 2016") # use AsDate to convert date strings
datetime_convert <- AsDate(datetime_data)
head(datetime_convert)
bitterempire$datetime <- datetime_convert
cbind(bitterempire, experience)

# get title data
title_data_html <- html_nodes(webpage,'.entry-title a')
head(title_data_html)
View(title_data_html)
typeof(title_data_html)
title_data_html
titles_only <- xml_text(title_data_html) # use xml_text to strip just the title text
bitterempire$title <- titles_only

#get post content 
content_data_html <- html_nodes(webpage,'.entry-content p')
#Data-Preprocessing: removing <p> and </p>
content_data_html<-gsub("<p>","",content_data_html)
content_data_html<-gsub("</p>","",content_data_html)
head(content_data_html)
bitterempire$contentPreview <- content_data_html

# get entry tags (tagged with)
tags_data_html <- html_nodes(webpage,'.entry-tags')
head(tags_data_html)
tags_only <- xml_text(tags_data_html) # use xml_text to strip just the tags text
tags_only <- sub("Tagged With: ", "", tags_only) # use sub to strip out preface text"
bitterempire$tags_only <- tags_only

# get entry tags (tagged with)
filed_under_html <- html_nodes(webpage,'.entry-categories')
head(filed_under_html)
filed_under <- xml_text(filed_under_html) # use xml_text to strip just the tags text
filed_under <- sub("Filed Under: ", "", filed_under) # use sub to strip out preface text"
bitterempire$filed_under <- filed_under

#export as csv
setwd("/Users/tejenson/Documents/coding/R coding/webscraping/bitterEmpire")
write.csv(bitterempire,'bitterempire.csv')