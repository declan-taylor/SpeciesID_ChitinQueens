#Code to better the supplamentary table.

```{r, message=FALSE, echo=FALSE}
# load the packages
library(kableExtra)
library(knitr)
library(tidyverse)
library(here)

info_table = read_csv(here("./data/info-table.csv"))

#write custom function to display the table how we want
knit_table = function(df){
  
  df = data.frame(apply(df, function(x){gsub("<br>", "\n", x)}),
                  stringsAsFactors = FALSE)
  
  
  df %>% 
    mutateall(linebreak) %>% 
    kable("latex", 
          booktabs = TRUE, 
          escape = FALSE, 
          longtable = TRUE) %>% 
    kable_styling(latex_options = "scale_down", 
                  full_width = FALSE,) %>% 
    column_spec(1, width = "5em") %>% 
    column_spec(2, width = "5em") %>% 
    column_spec(3, width = "5em") %>% 
    column_spec(4, width = "5em") %>% 
    column_spec(5, width = "5em") %>% 
    column_spec(7, width = "20em") 
}

knit_table = function(df){
  df = data.frame(lapply(df, function(x) {gsub("<br>", "\n", x)}), stringsAsFactors = F)
  
  df %>% 
    mutate_all(linebreak) %>% 
    kable("latex", 
          booktabs = TRUE, 
          escape = FALSE, 
          longtable = FALSE) %>% 
    kable_styling(latex_options = "scale_down", 
                  full_width = FALSE)  %>% 
    column_spec(1, width = "5em") %>% 
    column_spec(2, width = "5em") %>% 
    column_spec(3, width = "5em") %>% 
    column_spec(4, width = "5em") %>% 
    column_spec(5, width = "5em") %>% 
    column_spec(7, width = "20em")
}

knit_table(info_table)
```

```{r echo=FALSE, message=FALSE}
# load the packages
library(kableExtra)
library(knitr)
library(tidyverse)
library(here)

# read in the data
info_table = read_csv(here("./data/info-table.csv"))
# check it's in data.frame() from not just tbl form
ex_table=data.frame(ex_table)

# write custom function to display the table how we want
knit_table = function(df){
  if (is_html_output()) {
    df %>%
      kable("html", escape = F) %>%
      kable_styling()
  } else {
    df <- data.frame(lapply(df, function(x) {gsub("<br>", "\n", x)}), stringsAsFactors = F)
    
    df %>%
      mutate_all(linebreak) %>%
      kable("latex", booktabs = T, escape = F)
  }
}

knit_table(ex_table)
```
