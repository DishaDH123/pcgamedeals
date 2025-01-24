% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcgamedeals.R
\name{get_game_deals_df}
\alias{get_game_deals_df}
\title{Get details about a store's game deals}
\usage{
get_game_deals_df(storeID, price_limit)
}
\arguments{
\item{storeID}{integer. The store ID mentioned by the user}

\item{price_limit}{integer. The budget entered by the user}
}
\value{
A dataframe containing a store's title, ID,
the actual price of the game, the sale price of the game,
the percentage of savings on purchase and the rating of the deal.
}
\description{
This function fetches all the details about a
store's on going deals on games with the mentioned price limit
}
\examples{
get_game_deals_df(1,10)
}
