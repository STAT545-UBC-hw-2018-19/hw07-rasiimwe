context("plotting scatter and violin plots using ggplot2")

test_that("Test scatter", {
  #generating plot objectes using the created function nplots_scatter
  scatter_test_1 <- nplots_scatter(iris, iris$Sepal.Width, iris$Sepal.Length, xlab="Sepal.Width", ylab="Sepal.Length", title="Sepal Width Vs Length", plotly=FALSE)
  scatter_test_2 <- nplots_scatter(gapminder, gapminder$lifeExp, gapminder$gdpPercap, xlab="lifeExp", ylab="gdpPercap", title="lifeExp Vs GdpPercap", plotly=FALSE)
  #generated plot is expected to have geom point and geom smooth layers
  expect_identical(c("GeomPoint", "GeomSmooth") ,(sapply(scatter_test_1$layers, function(x) class(x$geom)[1])))
  expect_identical(c("GeomPoint", "GeomSmooth") ,(sapply(scatter_test_2$layers, function(x) class(x$geom)[1])))

  #second phase testing - sanity test
  arg1 <- c("GeomPoint", "GeomSmooth")
  arg2 <- (sapply(scatter_test_1$layers, function(x) class(x$geom)[1]))
  if(arg1[1] == arg2[1] & arg1[2] == arg2[2]){
    print("nplots_scatter function test - passed")
  }
  else{
    print("nplots_scatter function test - failed")
  }
})

test_that("Test violin", {
  #generating plot objects using the created function nplots_violin
  violin_test_1 <- nplots_violin(iris, iris$Sepal.Width, iris$Species, jitter=FALSE, order=TRUE, xlab="Specieds", ylab="Sepal.Width", title="Sepal Width Vs Length", plotly=FALSE, alpha=0.05, hjust=0.6)
  #generated plot is expected to have geom violin and geom point layers
  expect_identical(c("GeomViolin", "GeomPoint") ,(sapply(violin_test_1$layers, function(x) class(x$geom)[1])))

  #second phase testing - sanity test
  arg3 <- c("GeomViolin", "GeomPoint")
  arg4 <- (sapply(violin_test_1$layers, function(x) class(x$geom)[1]))
  if(arg3[1] == arg4[1] & arg3[2] == arg4[2]){
    print("nplots_violin function test - passed")
  }
  else{
    print("nplots_violin function test - failed")
  }
})

