## Pulse Project
## Perceived intelligence


# Initial Settings --------------------------------------------------------
rm(list = ls())
library(tidyverse)
options(stringsAsFactors = FALSE)
setwd("/Users/madelinehess/Desktop/17F/QSS88/PulseProject")


# Import Data -------------------------------------------------------------

df <- read.csv("Intelligence-11-13-17.csv") %>% 
  select(school, How.do.you.view.your.intelligence.compared.with.that.of.the.average.student.on.your.campus.) %>% 
  setNames(c("school", "question"))

# Wrangle -----------------------------------------------------------------
df1 <- df[-c(818),]

df1 <- df1 %>% 
  mutate(school = as.factor(school)) %>% 
  mutate(question = as.factor(question)) %>% 
  mutate(question2 = question) %>% 
  group_by(school) %>% 
  mutate(total_school = length(question)) %>% 
  ungroup() %>% 
  group_by(school, question) %>% 
  mutate(numerator = length(question2)) %>% 
  ungroup() %>% 
  mutate(percent = numerator / total_school)

df2 <- df1 %>% 
  select(school, question, percent) %>% 
  unique() %>% 
  spread(question, percent)

df3 <- df1 %>% 
  select(school, question, numerator) %>% 
  unique() %>% 
  spread(question, numerator) %>% 
  mutate(school = factor(school, levels = c("Princeton", "Harvard", "Yale", "Columbia", "UPenn", "Dartmouth", "Brown", "Cornell")))

df3 <- df3[c(6, 5, 8, 2, 7, 4, 1 , 3),]

# Export ------------------------------------------------------------------
write.csv(df2, "pulseproject_wrangled.csv", row.names = FALSE)
write.csv(df3, "pulseproject_wrangled2.csv", row.names = FALSE)



