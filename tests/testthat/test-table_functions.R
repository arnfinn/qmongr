test_that("data loads", {
  expect_type(qmongr::load_data(), "list")
  expect_equal(
    names(qmongr::load_data()),
    c("beskrivelse", "indikator")
  )
  expect_equal(
    names(qmongr::load_data("beskrivelse")),
    "beskrivelse"
  )
  expect_equal(
    names(qmongr::load_data("indikator")), "indikator")
})

nkr_data <- qmongr::load_data()

test_that("filter works", {
  expect_type(qmongr::filter_data(nkr_data), "list")
  expect_equal(
    unique(qmongr::filter_data(
      nkr_data,
      filter_settings = list(Aar = 2015))[["indikator"]][["Aar"]]),
    2015)
  expect_equal(
    unique(qmongr::filter_data(
      nkr_data,
      filter_settings = list(ShNavn = "OUS, RH"))[["indikator"]][["ShNavn"]]),
    "OUS, RH")
})

filtered_nkr <- qmongr::filter_data(nkr_data)


test_that("aggregate_data works", {
  expect_type(qmongr::aggregate_data(filtered_nkr), "list")
  expect_true("value1" %in% names(qmongr::aggregate_data(filtered_nkr)))
  expect_true("value0" %in% names(qmongr::aggregate_data(filtered_nkr)))
})

agg_nkr <- qmongr::aggregate_data(filtered_nkr)

test_that("compute_indicator works", {
  expect_type(qmongr::compute_indicator(agg_nkr), "list")
  expect_true("total" %in% names(qmongr::compute_indicator(agg_nkr)))
  expect_true("andel" %in% names(qmongr::compute_indicator(agg_nkr)))
})

test_that("compute_indicator works", {
  expect_type(
    qmongr::compute_national_indicator(nkr_data[["indikator"]]), "list")
  expect_true(
    "national_value0" %in% names(
      qmongr::compute_national_indicator(nkr_data[["indikator"]])))
  expect_true(
    "national_value1" %in% names(
      qmongr::compute_national_indicator(nkr_data[["indikator"]])))
  expect_true(
    "national_total" %in% names(
      qmongr::compute_national_indicator(nkr_data[["indikator"]])))
  expect_true(
    "national_andel" %in% names(
      qmongr::compute_national_indicator(nkr_data[["indikator"]])))
})