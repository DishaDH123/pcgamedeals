testing_data<-get_game_reviews_df(2,80)
test_that("Test if the dataframe returned has the right columns", {
  expect_is(testing_data,'data.frame')
  expect_is(testing_data$title, 'character')
  expect_is(testing_data$metacriticScore, 'numeric')

})
