testing_data<-get_deals_by_store_df(2)
test_that("Test if the dataframe returned has the right columns", {
  expect_is(testing_data,'data.frame')
  expect_is(testing_data$title, 'character')
  expect_is(testing_data$normalPrice, 'numeric')
  expect_is(testing_data$salePrice, 'numeric')
  expect_is(testing_data$savings, 'numeric')
  expect_is(testing_data$dealRating, 'numeric')
})
