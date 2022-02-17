testing_data<-get_active_stores()
test_that("Active stores function", {
  expect_is(testing_data,'data.frame')
  expect_is(testing_data$storeID, 'numeric')
  expect_is(testing_data$storeName, 'character')
})
