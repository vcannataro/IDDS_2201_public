robotstxt::paths_allowed("https://web.archive.org")


robotstxt::paths_allowed("https://avalon.law.yale.edu/subject_menus/inaug.asp")

library(tidyverse)
library(rvest)

page <- read_html("https://avalon.law.yale.edu/subject_menus/inaug.asp")

main_page <- page
write_rds(x = main_page, file = "Lectures/L10_functions_and_iteration/data/main_page.RData")


tables <- page %>%
  html_table()

tables[[3]]


elements <- page %>%
  html_elements("td a") %>%
  html_text()

elements_ref <- page %>%
  html_elements("td a") %>%
  html_attr("href")

elements[[20]]


page2 <- read_html("https://avalon.law.yale.edu/19th_century/monroe2.asp")
monroe2 <- page2

write_rds(x = monroe2, file = "Lectures/L10_functions_and_iteration/data/monroe2.RData")

inaug_text <- page2 %>%
  html_elements("p") %>%
  html_text()

paste(inaug_text,collapse = " ")


inaug_grab<- function(inaug_url){
  
  page <- read_html(inaug_url)
  
  inaug_text <- page %>%
    html_elements("p") %>%
    html_text() %>%
    paste(., collapse = " ")
   
  return(inaug_text)
  
}


inaug_grab(inaug_url = "https://avalon.law.yale.edu/19th_century/qadams.asp")



main_page <- read_html("https://avalon.law.yale.edu/subject_menus/inaug.asp")

tables <- main_page %>%
  html_table()



inaug_table <- tables[[3]]


colnames(inaug_table) <- inaug_table[1,]
inaug_table <- inaug_table[-1,]

inaug_table <- inaug_table %>%
  pivot_longer(cols = -President, 
               names_to = "Term", 
               values_to = "Year") %>%
  filter(!is.na(Year))









elements <- main_page %>%
  html_elements("td a") %>%
  html_text()

elements_ref <- main_page %>%
  html_elements("td a") %>%
  html_attr("href")

elements_tib <- tibble(
  ref = elements, 
  link = elements_ref
)


inaug_table <- left_join(x = inaug_table,
          y = elements_tib, 
          by = c("Year" = "ref"))


inaug_table <- inaug_table %>%
  mutate(link = str_remove(string = link, pattern = "../")) %>%
  mutate(full_link = 
           paste("https://avalon.law.yale.edu/",link,sep=""))


inaug_grab(inaug_url = inaug_table$full_link[1])

inaug_table$speech <- NA

for(speech_ind in seq_along(inaug_table$full_link)){
  inaug_table$speech[speech_ind] <- inaug_grab(inaug_url = inaug_table$full_link[speech_ind])
  message(paste("Got speech from",inaug_table$President[speech_ind],inaug_table$Term[speech_ind]))
  Sys.sleep(runif(1)+3)
}



tryCatch(read_html("https://avalon.law.yale.edu/19th_century/vanburen.asp"),error= function(cond){NA})




tryCatch(
  read_html("https://avalon.law.yale.edu/19th_century/vanburen.asp"),
  error = function(cond){NA})

inaug_grab<- function(inaug_url){
  
  page <- tryCatch(
    read_html(inaug_url),
    error = function(cond){NA})
  
  if(is.na(page)){
    return(NA)
  }
  
  inaug_text <- page %>%
    html_elements("p") %>%
    html_text() %>%
    paste(., collapse = " ")
  
  
  return(inaug_text)
  
}



for(speech_ind in seq_along(inaug_table$full_link)){
  inaug_table$speech[speech_ind] <- inaug_grab(inaug_url = inaug_table$full_link[speech_ind])
  message(paste("Got speech from",inaug_table$President[speech_ind],inaug_table$Term[speech_ind]))
  Sys.sleep(runif(1)+3)
}

write_rds(x = inaug_table, file = "Lectures/L10_functions_and_iteration/data/inaug_table.RData")

library(tidytext)

data(stop_words)

inaug_table %>%
  select(President,Term,speech) %>%
  unnest_tokens(word, speech) %>%
  anti_join(stop_words) %>%
  group_by(President, Term) %>%
  summarize(total_words = n()) %>%
  arrange(desc(total_words)) %>%
  View()


inaug_table$speech[2]




