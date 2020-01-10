# plumber.R

#* The name with the fortune cookie
#* @param first_name The first name of user
#* @param last_name The last name of user
#* @get /fortunecookie
function(first_name, last_name){
  
  Cookie <- read_html("http://www.fortunecookiemessage.com/") %>%
    html_nodes("a") %>% 
    html_attr("href") %>%
    grep("cookie/", ., value=TRUE) %>%
    
    # Cleaning 
    str_replace_all (pattern = "<p>", replacement = " ") %>%
    str_replace_all (pattern = "cookie", replacement = " ") %>%
    str_replace_all (pattern = "[:punct:]", replacement = " ") %>%
    str_replace_all (pattern = "\\d", replacement = " ") %>%
    str_replace_all (pattern = "< p>$" , replacement = " ") %>%
    str_trim (side = "both")  
  
  list(paste("Hi", first_name, last_name,".Your fortune is",Cookie))
}