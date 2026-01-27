library(tidyverse)
library(here)

(US_energy.wide <- read_csv("data/US_energy.wide.csv"))

library(janitor)

US_energy.wide %>% 
  clean_names() %>% 
  mutate(yyyymm = as.character(yyyymm), .keep = "unused") %>% 
  relocate(yyyymm) %>% 
  separate(col = yyyymm, into = c("yyyy", "mm"), 4) %>% 
  head()

file.choose()
