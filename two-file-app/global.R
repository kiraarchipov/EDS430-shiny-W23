# load packages ----
library(shiny)
library(lterdatasampler)
library(tidyverse)
library(shinyWidgets)

# data wrangling for trout ----
clean_trout <- and_vertebrates %>%
  filter(species == "Cutthroat trout") %>%
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) %>%
  mutate(channel_type = case_when(
    channel_type == "C" ~ "cascade",
    channel_type == "I" ~ "riffle",
    channel_type == "IP" ~ "isolated pool",
    channel_type == "P" ~ "pool",
    channel_type == "R" ~ "rapid",
    channel_type == "S" ~ "step (small falls)",
    channel_type == "SC" ~ "side channel"
  )) %>%
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) %>%
  drop_na()





