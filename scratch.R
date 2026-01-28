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

# functions ----
# notes from 'Programming w Functions' lecture

grouped_mean <- function(df, group_var, mean_var) {
  df %>% # assume tidy version of the pipe works fine too?!
    group_by({{group_var}}) %>% # why the double curly brackets? {{}}
    summarise(mean({{mean_var}}))
}

# dbl curlies, I think, tell the function to confine that argument to the 
# varible only. above, that'd limit it to working within 'group_by'...but 
# that doesn't make complete sense to me

library(tidyverse)
# wctri_catch %>% grouped_mean(SPECIES_CODE, NUMBER_FISH)
whales <- read_csv("data/whale_popn_wide.csv")
whales

whales.long <- whales %>% 
  pivot_longer(3:5, 
               names_to = "SPECIES_CODE",
               values_to = "NUMBER_FISH") %>% 
  print()

whales.long[3,4] <- 40
whales.long

whales.long %>% grouped_mean('SPECIES_CODE', 'NUMBER_FISH')
