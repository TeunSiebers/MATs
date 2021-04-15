library(tidyverse)
library(knitr)
library(kableExtra)
library(formattable)
library(magick)


dt <- rownames_to_column(mtcars, var = " ")[1:10, 1:12]

dt %>%
  rename("$\bb_1$" = mpg,
         "se" = cyl,
         "$P(T > |t|)$" = disp,
         "$\\beta_1$" = hp) %>% 
  
  kable(caption = "Figure 1. Model Parameters of the Fixed and Random Effect Models", 
        align = "c") %>%
  kable_classic(full_width = F, html_font = "Cambria") %>% 
  add_header_above(c(" " = 1, 
                     "Model 1" = 4, 
                     "Model 2" = 4, 
                     "Model 3" = 3)) %>% 
  add_header_above(c(" " = 1, 
                     "Fixed Effects" = 8, 
                     "Random Effects" = 3)) %>% 
  add_indent(c(2:3, 5:8, 10), all_cols = F) %>% 
  row_spec(7, hline_after = T) %>% 
  pack_rows(index = c("$Fixed$ $Effects$" = 6, "$Random$ $Effects^1$" = 4)) %>% 
  footnote(general = "Here is a general comments of the table. ",
           number = c("Footnote 1; ", "Footnote 2; "))
