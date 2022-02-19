# Data534 Final Project
<!-- badges: start -->
  [![R-CMD-check](https://github.com/DishaDH123/pcgamedeals/workflows/R-CMD-check/badge.svg)](https://github.com/DishaDH123/pcgamedeals/actions)
  <!-- badges: end -->


## Overview

This package is designed to allow users to more easily query the Cheap Shark API which collects information on current PC game deals. This API has a lot of information available, but most users may not be interested in all of the data available. This package is not exhaustive, but is intended to give users some useful custom functions that will allow them to access interesting consumer information quickly and easily. 

* `get_active_stores()` returns data frame on the current actively monitored PC game vendors and stores
* `get_game_deals_df()` returns data frame with various game price information by store under certain price threshold
* `get_game_reviews_df()` returns data frame with game titles and ratings from a particular store
* `get_deals_by_store_df()` returns a dataframe of all game deals in a particular store regardless of price
* `response()` takes multiple user inputs and returns a graph based on user choices. Designed to show various top 10 functionalities that were considered to be of interest to the average consumer. 

You can learn more about these in `vignette("PcGameDeals")

## Backends

##Installation 

The easiest way to get PCGameDeals is to simply install in your console. 
`install.packages('pcgameldeals')`

##Usage




---
## Link needs to be updated to our project once we are ready
Please note that this project is released with a [Contributor Code of Conduct](https://dplyr.tidyverse.org/CODE_OF_CONDUCT).
