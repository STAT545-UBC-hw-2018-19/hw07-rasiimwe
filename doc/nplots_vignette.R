## ------------------------------------------------------------------------
library(nplots)
library(tidyverse)
library(gapminder)
library(plotly)

## ------------------------------------------------------------------------
nplots_scatter(gapminder, gapminder$lifeExp, gapminder$gdpPercap, xlab="lifeExp", ylab="gdpPercap", title="lifeExp Vs GdpPercap", plotly=FALSE)

## ------------------------------------------------------------------------
nplots_violin(gapminder, gapminder$gdpPercap, gapminder$continent, jitter=TRUE, order=TRUE, xlab="", ylab="gdpPercap", title="gdpPercap across contients", plotly=TRUE, alpha=0.05, hjust=0.6)

## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

