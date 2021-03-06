% Generated by roxygen2 (4.0.2.9000): do not edit by hand
% Please edit documentation in R/reader.csv2.R
\name{reader.dataformat.csv2}
\alias{reader.dataformat.csv2}
\title{Read a semicolon separated values (.csv2) file.}
\usage{
\method{reader}{dataformat.csv2}(x, ...)
}
\arguments{
\item{x}{The path to the data set to be loaded.}

\item{...}{Further arguments.}
}
\value{
No value is returned; this function is called for its side effects.
}
\description{
This function will load a data set stored in the CSV2 file format into
the specified global variable binding.
}
\examples{
\dontrun{reader.csv2('example.csv2', 'data/example.csv2', 'example')}
}

