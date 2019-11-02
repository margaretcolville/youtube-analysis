#Data source : https://www.kaggle.com/datasnaek/youtube-new/data

library(readr)
library(jsonlite)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plotly)

fieldnames <- cols(video_id = col_character(),
                   trending_date = col_date(format = '%y.%d.%m'),
                   title = col_character(),
                   channel_title = col_character(),
                   category_id = col_integer(),
                   publish_time = col_datetime(),
                   tags = col_character(),
                   views = col_integer(),
                   likes = col_integer(),
                   dislikes = col_integer(),
                   comment_count = col_integer(),
                   thumbnail_link = col_character(),
                   comments_disabled = col_logical(),
                   ratings_disabled = col_logical(),
                   video_error_or_removed = col_logical(),
                   description = col_character()
                   )

ca <- read_csv('youtube-new/CAvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/CA_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
de <- read_csv('youtube-new/DEvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/DE_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
fr <- read_csv('youtube-new/FRvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/FR_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
gb <- read_csv('youtube-new/GBvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/GB_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
ind <- read_csv('youtube-new/INvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/IN_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
jp <- read_csv('youtube-new/JPvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/JP_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
kr <- read_csv('youtube-new/KRvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/KR_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
mx <- read_csv('youtube-new/MXvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/MX_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
ru <- read_csv('youtube-new/RUvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/RU_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )
us <- read_csv('youtube-new/USvideos.csv', col_types = fieldnames) %>%
  left_join(
    fromJSON('youtube-new/US_category_id.json', flatten = TRUE)$items %>%
      mutate(category_id = as.integer(id)) %>%
      rename(category_name = snippet.title) %>%
      select(category_id, category_name)
  )

t <- bind_rows(cbind(country = "CA", ca, stringsAsFactors = FALSE),
#cbind(country = "DE", de, stringsAsFactors = FALSE),
#cbind(country = "FR", fr, stringsAsFactors = FALSE),
cbind(country = "GB", gb, stringsAsFactors = FALSE),
#cbind(country = "IN", ind, stringsAsFactors = FALSE),
#cbind(country = "JP", jp, stringsAsFactors = FALSE),
#cbind(country = "KR", kr, stringsAsFactors = FALSE),
#cbind(country = "MX", mx, stringsAsFactors = FALSE),
#cbind(country = "RU", ru, stringsAsFactors = FALSE),
cbind(country = "US", us, stringsAsFactors = FALSE))

