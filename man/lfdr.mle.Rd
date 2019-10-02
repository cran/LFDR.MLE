\name{lfdr.mle}
\alias{lfdr.mle}
\title{Type II Maximum likelihood estimate of LFDR (LFDR-MLE).}
\description{
Estimates the local false discovery rate by the Type II maximum likelihood estimates (MLE).
}
\usage{
lfdr.mle(x, dFUN = dabsTd, lower.ncp = 0.001, upper.ncp = 20,lower.p0 = 0, upper.p0 = 1,
         fixed.p0 = NULL, fixed.ncp = NULL, d0 = 0, ...)
}
\arguments{
  \item{x}{Input numeric  vector of statistics. }
  \item{dFUN}{Density function; default \code{dabsTd} (from absolute value of the Student t distribution)}
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
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Yang, Y., & Bickel, D. R. (2010). Minimum description length and empirical Bayes methods of identifying SNPs associated with disease. Technical Report, Ottawa Institute of Systems Biology, COBRA Preprint Series, Article 74, available at biostats.bepress.com/cobra/ps/art74.

Bickel, D. R. (2010). Minimum description length methods of medium-scale simultaneous inference. arXiv preprint arXiv:1009.5981.

Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
}
\author{%Ye Yang, Marta Padilla, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky
Code: Ye Yang, Marta Padilla, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%Ye Yang, Marta Padilla, Alaa Ali, Kyle Leckett, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky and David R. Bickel
}
\note{
- The probability density function (\code{dFUN}) can be set to any other distribution, adapted so that the location parameter corresponds to ncp, other parameter to df and any other can be passed to \code{dFUN} by the dots (see examples in \code{\link{lfdr.mle}}).

- If computation fails for all features, \code{p0.hat} is set to NA and so is \code{LFDR.hat}, which is a vector of NA with lengh equal to the number of features. If it fails for a given feature, only the resulting LFDR for that feature is set to NA. Error messages are not suppressed.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{lfdr.mdl}}, \code{\link{lfdr.l1o}}, \code{\link{lfdr.lho}}.
}
\examples{
#numeric imput data: statistics of the data with missing values (removed internally)
#(result of a absolute t.test statistics on the data)
dfx <- 4;n.alt <- 1;n.null <- 4;true.ncp <- 7
W<-abs(c(rt(n=n.alt,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[3]<-NA

z1<-lfdr.mle(x=W,dFUN=dabsTd, df=dfx)
z2<-lfdr.mle(x=W,dFUN=dabsTd, df=dfx, fixed.p0=0.4, fixed.ncp=4)

#other dFUN -------
#NOTE: arguments for dFUN are x, df, ncp. If dFUN has other arguments, 
#please adapt them. For example:

new.df<-function(x,df,ncp,...){df(x=x,ncp=ncp,df1=df,...)}
z3<-lfdr.mle(x=W,df=dfx,dFUN=new.df,df2=5)
\dontshow{W;str(z1);str(z2);str(z3)}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ L0O }
\keyword{ LFDR-MLE }
\keyword{ LFDR-L0O }
\keyword{ Type II MLE }
\keyword{ Type II Maximum Likelihood Estimates }
\keyword{ Leave-zero-out }
\keyword{lfdr.mle}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
