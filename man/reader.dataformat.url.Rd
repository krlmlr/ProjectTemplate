% Generated by roxygen2 (4.0.2.9000): do not edit by hand
% Please edit documentation in R/reader.url.R
\name{reader.dataformat.url}
\alias{reader.dataformat.url}
\title{Read a remote file described in a .url file.}
\usage{
\method{reader}{dataformat.url}(x, ...)
}
\arguments{
\item{x}{The path to the data set to be loaded.}

\item{...}{Further arguments passed to the reader invoked.}
}
\value{
No value is returned; this function is called for its side effects.
}
\description{
This function will load data from a remote source accessible through
HTTP or FTP based on configuration information found in the specified
.url file. The .url file must specify the URL of the remote data source
and the type of data that is available remotely. Only one data source
per .url file is supported currently.
}
\details{
Examples of the DCF format and settings used in a .url file are shown
below:

Example 1:

\preformatted{url: http://www.johnmyleswhite.com/LoadMyData/sample_data.csv
}

Example 1:

\preformatted{url: http://www.johnmyleswhite.com/LoadMyData/some?query
extension: .csv.bz2
}
}
\examples{
\dontrun{reader.url('example.url', 'data/example.url', 'example')}
}

