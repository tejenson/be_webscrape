# be_webscrape
R code used to scrape tag &amp; text contents from all of my posts on BitterEmpire.com
1. import html contents from list of URLs
2. use xml2 pkg to read_html contents
3. use SelectorGadget (separately) to identify CSS tags to pull
4. create data_extract function to extract desired tags/text from html content that returns a 1-row dataframe with columns corresponding to desired tags/text 
5. run data extract function for each post
6. combine all individual extracted dataframes into one combined dataframe (one row per post)
7. kick dataframe to textfile

Future updates/improvements: impose some order/formatting/headers before kicking to textfile?
