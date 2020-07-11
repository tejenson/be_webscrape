install.packages("rvest")
library(xml2)
library(rvest)
require(devtools)
require(usethis)
install_github("Displayr/flipTime")
library(flipTime)
library(tidyverse)
library(Rcrawler)
# URL with scraping instrs/example: 
# https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/


#####################################
# pull from all of my individual post pages (to get the full post content for each)
# figure out how to use RCrawler...nah skip this for now, just load each of the URLs manually
# for future, check out RCrawler tutorial https://github.com/salimk/Rcrawler#how-to-use-rcrawler
url1 <- 'http://bitterempire.com/all-mobile-devices-will-soon-be-made-of-trees/'
url2 <- 'http://bitterempire.com/the-publication-pollution-problem-part-ii-episode-spam-a-lot/'
url3 <- 'http://bitterempire.com/februarys-playlist-to-make-running-suck-less-leap-year-edition/'
url4 <- 'http://bitterempire.com/januarys-playlist-to-make-running-suck-less-freeze-yer-gizzard-edition/'
url5 <- 'http://bitterempire.com/british-arrows-year-best-british-adverts/'
url6 <- 'http://bitterempire.com/playlists-make-running-suck-less-year-end-compilation-time/'
url7 <- 'http://bitterempire.com/pray-science-will-save-mimosas-blight-citrus-greening/'
url8 <- 'http://bitterempire.com/septembers-playlist-to-make-running-suck-less-yacht-rock-edition/'
url9 <- 'http://bitterempire.com/this-weeks-bitter-science-round-up/'
url10 <- 'http://bitterempire.com/augusts-playlist-make-running-suck-less-smorgasbord-edition/'
url11 <- 'http://bitterempire.com/julys-playlist-to-make-running-suck-less-80s-edition/'
url12 <- 'http://bitterempire.com/university-of-iowa-libraries-preserving-badly-mimeographed-spec-fic-fanzines-for-all-time/'
url13 <- 'http://bitterempire.com/goat-simulator-the-goat-you-were-meant-to-be/'
url14 <- 'http://bitterempire.com/science-proves-dying-can-also-include-special-nice-time/'
url15 <- 'http://bitterempire.com/autocross-is-your-own-personal-fast-and-furious/'
url16 <- 'http://bitterempire.com/junes-playlist-to-make-running-suck-less-country-bluegrass-edition/'
url17 <- 'http://bitterempire.com/new-ways-your-skinny-jeans-are-trying-to-murder-you/'
url18 <- 'http://bitterempire.com/sexytime-nostalgia-in-mice-short-circuits-depression/'
url19 <- 'http://bitterempire.com/super-deformed-octopus-is-super-adorable/'
url20 <- 'http://bitterempire.com/google-earth-and-street-view-coming-soon-to-a-cancer-near-you/'
url21 <- 'http://bitterempire.com/hrt-and-one-more-way-motherhood-might-be-wrecking-your-life/'
url22 <- 'http://bitterempire.com/mays-playlist-to-make-running-suck-less/'
url23 <- 'http://bitterempire.com/h5n2-avian-flu-electric-flugaloo/'
url24 <- 'http://bitterempire.com/were-all-going-to-die-of-a-hantavirus-outbreak-because-bamboo/'
url25 <- 'http://bitterempire.com/today-in-why-cant-ladies-just-accept-their-place-as-lazy-grifters/'
url26 <- 'http://bitterempire.com/aprils-playlist-make-running-suck-less-classical-edition/'
url27 <- 'http://bitterempire.com/now-heres-some-gun-violence-we-can-all-get-behind/'
url28 <- 'http://bitterempire.com/science-publishing-bloatware/'
url29 <- 'http://bitterempire.com/this-months-playlist-to-make-running-suck-less/'
url30 <- 'http://bitterempire.com/robot-infants/'
url31 <- 'http://bitterempire.com/ninety-nine-fourty-four-one-hundredths-percent-pure-human-genome/'
url32 <- 'http://bitterempire.com/one-step-closer-to-a-herpes-vaccine-while-no-remedy-in-sight-for-geraldo/'
url33 <- 'http://bitterempire.com/dollhouse-stem-children/'
url34 <- 'http://bitterempire.com/hate-running-bpm-mindless-running-machine/'
url35 <- 'http://bitterempire.com/five-ways-scam-winter-bliss/'
url36 <- 'http://bitterempire.com/love-british-arrow-awards-let-us-count-ways/'
url37 <- 'http://bitterempire.com/death-no-bigs/'
webpage1 <- read_html(url1)
webpage2 <- read_html(url2)
webpage3 <- read_html(url3)
webpage4 <- read_html(url4)
webpage5 <- read_html(url5)
webpage6 <- read_html(url6)
webpage7 <- read_html(url7)
webpage8 <- read_html(url8)
webpage9 <- read_html(url9)
webpage10 <- read_html(url10)
webpage11 <- read_html(url11)
webpage12 <- read_html(url12)
webpage13 <- read_html(url13)
webpage14 <- read_html(url14)
webpage15 <- read_html(url15)
webpage16 <- read_html(url16)
webpage17 <- read_html(url17)
webpage18 <- read_html(url18)
webpage19 <- read_html(url19)
webpage20 <- read_html(url20)
webpage21 <- read_html(url21)
webpage22 <- read_html(url22)
webpage23 <- read_html(url23)
webpage24 <- read_html(url24)
webpage25 <- read_html(url25)
webpage26 <- read_html(url26)
webpage27 <- read_html(url27)
webpage28 <- read_html(url28)
webpage29 <- read_html(url29)
webpage30 <- read_html(url30)
webpage31 <- read_html(url31)
webpage32 <- read_html(url32)
webpage33 <- read_html(url33)
webpage34 <- read_html(url34)
webpage35 <- read_html(url35)
webpage36 <- read_html(url36)
webpage37 <- read_html(url37)

# data/tags to scrape: title (entry-title), datetime (.entry-time),  
# tagged with (entry-tags), filed under (entry-categories), content/text (entry-content)
# use SelectorGadget to get the specific CSS selectors that encloses the element you want

data_extract <- function(html_obj) { # function to pull the tags/content I want from each webpage
  contents <- data.frame(row.names = 1) # create dataframe with 1 row, 0 cols)
  
  #1. grab date data
  datetime_data_html <- html_nodes(html_obj,'.entry-time')
  datetime_data <- html_text(datetime_data_html) #Converting the datetime data to text
  datetime_convert <- AsDate(datetime_data) # use AsDate to convert date strings
  contents$datetime <- datetime_convert
  
  #2. grab title data
  title_data_html <- html_nodes(html_obj,'.entry-title')
  titles_only <- xml_text(title_data_html) # use xml_text to strip just the title text
  contents$title <- titles_only
  
  #3. get entry tags (tagged with)
  tags_data_html <- html_nodes(html_obj,'.entry-tags')
  tags_only <- xml_text(tags_data_html) # use xml_text to strip just the tags text
  tags_only <- sub("Tagged With: ", "", tags_only) # use sub to strip out preface text"
  contents$tags_only <- tags_only
  
  #4. get filed-under tags -> this is giving me dupe cats - fix at some point
  filed_under_html <- html_nodes(html_obj,'.entry-categories')
  filed_under <- xml_text(filed_under_html) # use xml_text to strip just the tags text
  filed_under <- filed_under[-2] # 2 elements are being grabbed for reasons I can't fix, so ax the 2nd
  contents$filed_under <- filed_under
  
  #5. get post text
  #get post content 
  post_text_html <- html_nodes(html_obj,'.entry-content p, p:nth-child(2) , p:nth-child(5) , p:nth-child(6) , p:nth-child(7)')
  post_text_html <- xml_text(post_text_html) # use xml_text to strip just the title text
  post_text <- paste(unlist(post_text_html), collapse =" ") # transform dataframe into char vector
  contents$post_text <- post_text
  
  return(contents)
}

data_extract(webpage1)

pg1 <- data_extract(webpage1)
pg2 <- data_extract(webpage2)
pg3 <- data_extract(webpage3)
pg4 <- data_extract(webpage4)
pg5 <- data_extract(webpage5)
pg6 <- data_extract(webpage6)
pg7 <- data_extract(webpage7)
pg8 <- data_extract(webpage8)
pg9 <- data_extract(webpage9)
pg10 <- data_extract(webpage10)
pg11 <- data_extract(webpage11)
pg12 <- data_extract(webpage12)
pg13 <- data_extract(webpage13)
pg14 <- data_extract(webpage14)
pg15 <- data_extract(webpage15)
pg16 <- data_extract(webpage16)
pg17 <- data_extract(webpage17)
pg18 <- data_extract(webpage18)
pg19 <- data_extract(webpage19)
pg20 <- data_extract(webpage20)
pg21 <- data_extract(webpage21)
pg22 <- data_extract(webpage22)
pg23 <- data_extract(webpage23)
pg24 <- data_extract(webpage24)
pg25 <- data_extract(webpage25)
pg26 <- data_extract(webpage26)
pg27 <- data_extract(webpage27)
pg28 <- data_extract(webpage28)
pg29 <- data_extract(webpage29)
pg30 <- data_extract(webpage30)
pg31 <- data_extract(webpage31)
pg32 <- data_extract(webpage32)
pg33 <- data_extract(webpage33)
pg34 <- data_extract(webpage34)
pg35 <- data_extract(webpage35)
pg36 <- data_extract(webpage36)
pg37 <- data_extract(webpage37)

be_combined <- bind_rows(pg1,pg2) # concatenate rows from each post into one combined dataframe
View(be_combined)
be_combined <- bind_rows(be_combined,pg3)
be_combined <- bind_rows(be_combined,pg4)
be_combined <- bind_rows(be_combined,pg5)
be_combined <- bind_rows(be_combined,pg6)
be_combined <- bind_rows(be_combined,pg7)
be_combined <- bind_rows(be_combined,pg8)
be_combined <- bind_rows(be_combined,pg9)
be_combined <- bind_rows(be_combined,pg10)
be_combined <- bind_rows(be_combined,pg11)
be_combined <- bind_rows(be_combined,pg12)
be_combined <- bind_rows(be_combined,pg13)
be_combined <- bind_rows(be_combined,pg14)
be_combined <- bind_rows(be_combined,pg15)
be_combined <- bind_rows(be_combined,pg16)
be_combined <- bind_rows(be_combined,pg17)
be_combined <- bind_rows(be_combined,pg18)
be_combined <- bind_rows(be_combined,pg19)
be_combined <- bind_rows(be_combined,pg20)
be_combined <- bind_rows(be_combined,pg21)
be_combined <- bind_rows(be_combined,pg22)
be_combined <- bind_rows(be_combined,pg23)
be_combined <- bind_rows(be_combined,pg24)
be_combined <- bind_rows(be_combined,pg25)
be_combined <- bind_rows(be_combined,pg26)
be_combined <- bind_rows(be_combined,pg27)
be_combined <- bind_rows(be_combined,pg28)
be_combined <- bind_rows(be_combined,pg29)
be_combined <- bind_rows(be_combined,pg30)
be_combined <- bind_rows(be_combined,pg31)
be_combined <- bind_rows(be_combined,pg32)
be_combined <- bind_rows(be_combined,pg33)
be_combined <- bind_rows(be_combined,pg34)
be_combined <- bind_rows(be_combined,pg35)
be_combined <- bind_rows(be_combined,pg36)
be_combined <- bind_rows(be_combined,pg37)

write.table(be_combined, "be_combined.txt", sep="\t") #kick dataframe to text file


