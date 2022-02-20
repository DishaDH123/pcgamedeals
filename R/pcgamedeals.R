#'@import httr
#'@import tidyverse
#'@import ggplot2
#'@import dplyr
#'@import scales
#' @export
get_active_stores <- function() {
  #' @title Active store IDs and Store names
  #'
  #' @description This function fetches all the active store IDs
  #' and the store names in the API
  #'
  #' @return A dataframe with currently active stores and the store IDs being monitored by the API
  #'
  #' @examples get_active_stores()


  stores <- GET("https://www.cheapshark.com/api/1.0/stores") # Using GET function to colect data from cheapshark api.

  if (status_code(stores) != 200) {
    stop(paste("There was an error with the API. The reponse status is:", status_code(g))) #Checking if the status of the request GET query was successful or not
  }

  s <- content(stores, "parsed") # parsing the received data

  df <- s %>%  #filtering and modifying the data to find only active stores,and selecting only storeName and storeID
    bind_rows %>%
    filter(isActive == 1) %>%
    select(storeName, storeID) %>%
    distinct() %>%
    mutate(storeID = as.numeric(storeID))

  df #returns the dataframe containing storeName and storeID

}
#' @export
get_game_deals_df <- function(storeID, price_limit) {

  #' @title Get details about a store's game deals
  #'
  #' @description This function fetches all the details about a
  #' store's on going deals on games with the mentioned price limit
  #'
  #' @param storeID integer. The store ID mentioned by the user
  #' @param price_limit integer. The budget entered by the user
  #'
  #' @return A dataframe containing a store's title, ID,
  #' the actual price of the game, the sale price of the game,
  #' the percentage of savings on purchase and the rating of the deal.
  #' @examples get_game_deals_df(1,10)

  if (!is.numeric(storeID))
    stop("Cannot compute of a vector of characters.") # To check if the paramters passed is numeric or not

  if (!is.numeric(price_limit))
    stop("Cannot compute of a vector of characters.") # To check if the paramters passed is numeric or not

  url <- paste0("https://www.cheapshark.com/api/1.0/deals?storeID=", storeID, "&upperPrice=", price_limit) # Using GET function to colect data from cheapshark api, we also pass paramters such as stoerID and upperprice to obtain game deals from a particular store within given budget.

  g <- GET(url)
  if (status_code(g) != 200) {
    stop(paste("There was an error with the API. The reponse status is:", status_code(g))) #Checking if the status of the request GET query was successful or not.
  }

  deals <- content(g, "parsed") # parsing the received data

  df <- deals %>%   #filtering and selecting only title,storeID,normalPrice,salePrice,savings,dealRating
    bind_rows%>%
    select(title, storeID, normalPrice, salePrice, savings, dealRating)%>%
    mutate(normalPrice = as.numeric(normalPrice),
           salePrice = as.numeric(salePrice),
           savings = as.numeric(savings),
           dealRating = as.numeric(dealRating),
           storeID = as.numeric(storeID))

  df #returns the dataframe containing storeName and storeID

}




#' @export
get_game_reviews_df <- function(storeID, rating) {
  #' @title Get details about a store's game reviews
  #'
  #' @description This function fetches the rating for
  #' all the games in a store
  #'
  #' @param storeID integer. The store ID mentioned by the user
  #' @param rating integer. The minimum rating mentioned by the user
  #'
  #' @return A dataframe containing the name of the game
  #' and the meta critic score of the game.
  #'The meta critic score will be above the one mentioned by the user.
  #' @examples get_game_reviews_df(3,90)

  if (!is.numeric(storeID))
    stop("Cannot compute of a vector of characters.") # To check if the paramters passed is numeric or not

  if (!is.numeric(rating))
    stop("Cannot compute of a vector of characters.") # To check if the paramters passed is numeric or not

  url <- paste0("https://www.cheapshark.com/api/1.0/deals?storeID=", storeID, "&metacritic=", rating) # Using GET function to colect data from cheapshark api, we pass paramters such as storeID and rating to obtain game deals from a particular store and rating above of how much is required.

  g <- GET(url)
  if (status_code(g) != 200) {
    stop(paste("There was an error with the API. The reponse status is:", status_code(g))) #Checking if the status of the request GET query was successful or not.
  }

  deals <- content(g, "parsed")  # parsing the received data

  df <- deals %>%   #filtering and selecting only title,metacriticscore
    bind_rows%>%
    select(title, metacriticScore)%>%
    mutate(metacriticScore = as.numeric(metacriticScore))

  return(df)  #returns the dataframe containing storeName and storeID

}




#' @export
get_deals_by_store_df <- function(storeID) {
  #' @title Get details about a store's maximum deals
  #'
  #' @description This function fetches the details
  #' about the given store
  #'
  #' @param storeID integer. The store ID mentioned by the user
  #'
  #' @return A dataframe containing the name of the game,
  #' the store ID, the normal price of a game, the sale price on a game,
  #' the savings and the deal rating off the game.
  #' @examples get_deals_by_store_df(2)


  if (!is.numeric(storeID))
    stop("Cannot compute of a vector of characters.")  # To check if the paramters passed is numeric or not

  url <- paste0("https://www.cheapshark.com/api/1.0/deals?storeID=", storeID) # Using GET function to colect data from cheapshark api,we pass storeID in the URL to retrive stores with best deals.

  g <- GET(url)
  if (status_code(g) != 200) {
    stop(paste("There was an error with the API. The reponse status is:", status_code(g)))  #Checking if the status of the request GET query was successful or not.
  }

  deals <- content(g, "parsed")  # parsing the received data

  df <- deals %>%    #filtering and selecting only title,normalPrice,salePrice,savings and dealRating
    bind_rows%>%
    select(title,normalPrice, salePrice, savings, dealRating)%>%
    mutate(normalPrice = as.numeric(normalPrice),
           salePrice = as.numeric(salePrice),
           savings = as.numeric(savings),
           dealRating = as.numeric(dealRating))

  df   #returns the dataframe containing storeName and storeID

}

#'@export
response <- function(){
  #' @title Interactive function to pull interesting game price data
  #'
  #' @description This function first pulls currently active store data. This active
  #' store data is then given to the user to choose a store of interest. User then chooses a store from
  #' the active list. Next, user is presented with one one of three key options: budget,
  #' deal rating and game rating. User choice on this section will dictate what data is returned from the API.
  #' Data is first returned in a data frame, and is used to create a visualization based on user choice.
  #'
  #' @return a plot based on user input
  #'


  y <- get_active_stores() #calling function get_active_stores to obtain current active stores.

  cat("Please select a Store Number from below options \n") # Taking user input

  for (i in 1:nrow(y))
  {
    cat(y$storeName[i],":", y$storeID[i],"\n")  # Displpaying all active stores for user to make a choice from.
  }

  val <- readline("Enter value here: ") #Taking inut from user
  val <- as.integer(val) #Converting it into a integer
  if (is.na(val))  #Checking if the user entered an integer and not a string or character.
    stop("Store Number needs to be an integer")
  cat("Select what you want from the below options:\n 1. Game within a budget\n2.Savings and current deal rating\n3.Games above a certain rating")
  opt <- readline("Enter your choice : ")  #Taking inut from user
  opt <- as.integer(opt)   #Converting it into a integer
  if (is.na(opt))
    stop("Choice needs to be a number from 1-3")    #Checking if the user entered an integer and not a string or character.

  if(opt==1){   #if user choice o[ption 1 
    bud <- readline("Enter your budget: ") #taking user input
    bud <- as.integer(bud) #converting into an integer
    if (is.na(bud))    #Checking if the user entered an integer and not a string or character.
      stop("Budget value needs to be an integer")
    data <- get_game_deals_df(val,bud) #calling the game deals function
    options(repr.plot.width=12, repr.plot.height=5) #plotting the Top 10 games under personal budget
    data %>% mutate(price_diff = normalPrice-salePrice) %>% arrange(desc(price_diff)) %>% head(10) %>%
      ggplot() +
      aes(   #setting x and y values
        x = salePrice,
        y = reorder(title,salePrice),
        label = salePrice,
        fill = title,
      ) +
      geom_col() + #choosing column plot
      geom_label() + #adding labels
      labs(x="Game Sale Price", 
           y='Game Titles',
           title='Top 10 Games Under Personal Budget')+
      theme_bw() +  #removing the background grid.
      theme(legend.position="none") + #removing the legend
      scale_x_continuous(labels=scales::dollar_format()) + #Adding $ sign on the x axis as it contains sale price.
      theme(axis.text.x = element_text(angle = 60,hjust=1,face='bold',size=10), #setting up theme for x and y axis elements.
            axis.text.y = element_text(face='bold',size=10),
            axis.title = element_text(face='bold',size=12),
            plot.title = element_text(face='bold',size=12))

  }
  else if(opt==2){ #if user choice o[ption 2
    cat("Displaying top 10 games with high savings and their corresponding rating")  #taking user input
    deal <- get_deals_by_store_df(val)   #calling the get deals by store function
    options(repr.plot.width=12, repr.plot.height=25)   #plotting the Top 10 games under personal budget
    deal %>% arrange(desc(dealRating)) %>% head(10) %>%
      ggplot()+
      aes(  #setting x and y values
        x=reorder(title,desc(dealRating)),
        y=savings,
        color=dealRating
      )+
      geom_point()+  #choosing column plot
      labs(x="Game Title",y='Metacritic Rating',title=' Top 10 Games sorted by Deal Rating')+  #adding labels
      theme_bw()+  #removing the background grid.
      theme(axis.text.x = element_text(angle = 60,hjust=1,face='bold',size=10),  #setting up theme for x and y axis elements.
            axis.text.y = element_text(face='bold',size=10),
            axis.title = element_text(face='bold',size=15),
            plot.title = element_text(face='bold',size=20))
  }
  else if(opt==3){  #if user choice o[ption 2
    rat <- readline("Enter the lowest rating (out of 100) you want to see:")  #taking user input
    rat <- as.integer(rat)  #converting into an integer
    if (is.na(rat))  #Checking if the user entered an integer and not a string or character.
      stop("Rating value needs to be an integer")
    ratings <- get_game_reviews_df(val,rat)
    options(repr.plot.width=12, repr.plot.height=25)  #plotting the Top 10 games under personal budget
    ratings %>% arrange(desc(metacriticScore)) %>% head(10) %>%
      ggplot() + 
      aes(x= reorder(title, desc(metacriticScore)), y= metacriticScore, label= metacriticScore) +  #setting x and y values
      geom_bar(stat="identity") + #choosing column plot
      geom_label() +  #adding labels
      ggtitle("Top 10 Rated Games") +
      xlab("Game Titles") + ylab("Ratings") + 
      theme_bw() + #removing the background grid.
      theme(axis.text.x = element_text(angle = 60,hjust=1,face='bold',size=10),  #setting up theme for x and y axis elements
            axis.text.y = element_text(face='bold',size=10),
            axis.title = element_text(face='bold',size=15),
            plot.title = element_text(face='bold',size=20))
  }
  
}

