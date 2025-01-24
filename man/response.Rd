% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcgamedeals.R
\name{response}
\alias{response}
\title{Interactive function to pull interesting game price data}
\usage{
response()
}
\value{
a plot based on user input
}
\description{
This function first pulls currently active store data. This active
store data is then given to the user to choose a store of interest. User then chooses a store from
the active list. Next, user is presented with one one of three key options: budget,
deal rating and game rating. User choice on this section will dictate what data is returned from the API.
Data is first returned in a data frame, and is used to create a visualization based on user choice.
}
