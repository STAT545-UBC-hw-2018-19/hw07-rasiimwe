% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nplots_violin.R
\name{nplots_violin}
\alias{nplots_violin}
\title{nplots_violin
: Generate violin plots using ggplot2}
\usage{
nplots_violin(x, y_variable, factor, jitter = TRUE, order = TRUE,
  xlab = "", ylab = "", title = "", plotly = TRUE, alpha = 0.05,
  hjust = 0.5)
}
\arguments{
\item{x}{The dataset to be used}

\item{y_variable}{y-axis variable for the  violin plot}

\item{factor}{the factor variable to be used in the violin plot}

\item{jitter}{argument to specify whether jitter should be included in plot - supply arguments TRUE of FALSE}

\item{order}{argument to specify whether factor reorder should be applied to a plot - supply arguments TRUE of FALSE}

\item{xlab}{argument to specify x axis label}

\item{ylab}{argument to specify y axis label}

\item{title}{argument to specify the plot title to be applied}

\item{plotly}{argument to specify whether the genereated plot should be rendered as a plotly plot}

\item{alpha}{argument to specify geom_poin opacity or transparency magnitude}

\item{hjust}{argument to specify horizontal justification of the plot title}
}
\value{
violin plot
}
\description{
This function takes your plot arguments like the data, aesthetics, plot layers and labels and creates a violin plot for you using ggplot2. You don't have to worry about writing a bunch of lines of code. This function takes care ofthat for you!
}
\details{
This function takes plot the specified plot arguments and produces a violin plot using - \code{\link{nplots_violin}} with the background machinery being ggplot2. Future versions of this function will provide an inclusion of other plot layers and objects to work with.
}
\examples{
\\code {nplots_violin(gapminder, gapminder$gdpPercap, gapminder$continent, jitter=TRUE, order=TRUE, xlab="Continent", ylab="gdpPercap", title="gdpPercap across continents", plotly=TRUE, alpha=0.05, hjust=0.5)}
\\code {nplots_violin(iris, iris$Sepal.Width, iris$Species, jitter=FALSE, order=TRUE, xlab="Sepal.Width", ylab="Sepal.Length", title="Sepal Width Vs Length", plotly=FALSE)}
}
