\name{dabsTd}
\alias{dabsTd}

\title{
Density of the absolute Student t Distribution.
}
\description{
Density of the absolute t distribution with df degrees of freedom and non-centrality parameter ncp.
}
\usage{
dabsTd(x, df, ncp = 0, ...)
}

\arguments{
  \item{x}{vector of quantiles.}
  \item{df}{
degrees of freedom (>0).
}
  \item{ncp}{
noncentrality parameter.
}
  \item{\dots}{
arguments to pass to functions \code{dt} from basic R.
}

}

\value{
numeric of length equal to the length of x.
}

\author{
  Code: David R. Bickel,\cr
  Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
}

\seealso{
Function \code{\link{dt}} from basic R.
}
\examples{
  z1<-dabsTd(x = c(1:4), df = 3, ncp = 3)
 }
