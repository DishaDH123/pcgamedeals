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

## Installation 

The easiest way to get PCGameDeals is to simply install in your console. 

`library(devtools)`
`install_github("DishaDH123/pcgamedeals")`

## Usage

Users have the option of using any of the individual functions in this package to retrieve information. The information returned to the user will be in the form of a dataframe. 

For a fully automated experience, users can call the response() function. 

Once the response function is called, there are several user determined options to choose from shown below:

First the user is asked to choose from the given list of stores and is prompted to enter the store ID.
![First output](/assets/1.png)

Once the user types in the store ID, he is asked to choose from 3 options.
On choosing option 1, the user is asked to enter a budget. A graph with the top 10 games within the specified budget is displayed.
![Second output](/assets/2.png)

On choosing option 2, the user is displayed with the top 10 games by deal rating
![Third output](/assets/3.png)

On choosing option 3, the user is asked to enter the percentage savings, and the graph showing top 10 games within the specified savings is displayed.
![Fourth output](/assets/4.png)

---
Please note that this project is released with a [Contributor Code of Conduct](https://github.com/DishaDH123/pcgamedeals/blob/main/CODE_OF_CONDUCT.md).
