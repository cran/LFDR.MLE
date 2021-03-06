\name{lfdr.mdl}
\alias{lfdr.mdl}
\alias{lfdr.mdlo}
\title{Minimum description length (MDL) method for estimation of LFDR.}
\description{
Estimate the local false discovery rate using the minimum description length (MDL) method.
}

\usage{ 
lfdr.mdl(x, dFUN = dabsTd, lower.ncp = 0.001, upper.ncp = 20, lower.p0 = 0,
        upper.p0 = 1, fixed.p0 = NULL, fixed.ncp = NULL, d0 = 0, ...)

lfdr.mdlo(x, v = 0, dFUN = dabsTd, lower.ncp = 0.001, upper.ncp = 20, 
        lower.p0 = 0, upper.p0 = 1, fixed.p0 = NULL, fixed.ncp = NULL,
        d0 = 0, ...)  
}
\arguments{
 \item{x}{Input numeric  vector of statistics. }
  \item{dFUN}{Density function; default \code{dabsTd} (from absolute value of the Student t distribution)}
  \item{v}{v in [0,1], portion of one feature that is considered in turn to estimate the LFDR; default value is v=0 (for \code{lfdr.l1o} (L1O)) and v=1/2 (for \code{lfdr.lho} (LHO)). For other values of v, use \code{lfdr.lo}.}
  \item{lower.ncp}{The lowerbound of the location parameter of \code{dFUN} (noncentrality parameter for default \code{dFUN=dabsTd}); default value is 0.001}
  \item{upper.ncp}{The upperbound of the location parameter of \code{dFUN} (noncentrality parameter for default \code{dFUN=dabsTd}); default value is 20}
  \item{lower.p0}{The lowerbound of p0 (proportion of unaffected features (null hypothesis)); default value is 0}
  \item{upper.p0}{The upperbound of p0 (proportion of unaffected features (null hypothesis)); default value is 1}
  \item{fixed.p0}{A fixed value of p0 (proportion of unaffected features (null hypothesis)); default value is NULL}
  \item{fixed.ncp}{A fixed value of the location parameter of \code{dFUN} (noncentrality parameter for default \code{dFUN=dabsTd}); default value is NULL}
  \item{d0}{the numeric value of the null hypothesis for \code{dFUN}, default value is 0.}
  \item{\dots}{Other parameters to pass to \code{dFUN} (see notes and examples).}
 }

\value{
A list with:
  \item{LFDR.hat}{estimates of the LFDR}
  \item{p0.hat}{estimate of the proportion of unaffected features p0 (true null hypothesis). }
  \item{ncp.hat}{estimate of the location parameter of the distribution \code{dFUN} (ncp: noncentrality parameter of \code{dFUN=dabsTd} by default). }
  \item{info}{method name and information about computation failure.}
}
\references{
Bickel, D. R. (2010). Minimum description length methods of medium-scale simultaneous inference. arXiv preprint arXiv:1009.5981.

Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
}
\author{
Code: Marta Padilla\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky, Ye Yang, Marta Padilla, Alaa Ali, Kyle Leckett, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky and David R. Bickel
}
\note{
- The probability density function (\code{dFUN}) can be set to any other distribution, adapted so that the location parameter corresponds to ncp, other parameter to df and any other can be passed to \code{dFUN} by the dots (see examples in \code{\link{lfdr.mle}}).

- If computation fails for all features, \code{p0.hat} is set to NA and so is \code{LFDR.hat}, which is a vector of NA with lengh equal to the number of features. If it fails for a given feature, only the resulting LFDR for that feature is set to NA. Error messages are not suppressed.
}

%\details{same inputs and outputs than \code{\link{lfdr.mle}}}
\seealso{
\code{\link{lfdr.mle}}, \code{\link{lfdr.l1o}}.
}

\examples{
dfx <- 4;n.alt <- 1;n.null <- 4;true.ncp <- 7
#numeric imput data: statistics of the data with missing values (removed internally)
#(result of a absolute t.test statistics on the data)
W<-abs(c(rt(n=n.alt,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[3]<-NA

z1<-lfdr.mdl(x=W,df=dfx)
z2<-lfdr.mdl(x=W,df=dfx,fixed.ncp=10)
z3<-lfdr.mdlo(x=W,df=dfx,v=1/3,fixed.p0=0.3)
\dontshow{W;str(z1);str(z2);str(z3)}
}
\keyword{ MDL }
\keyword{ LFDR-MDL }
\keyword{ Minimum Description Length }
\keyword{lfdr.mdl}
\keyword{lfdr.mdlo}
