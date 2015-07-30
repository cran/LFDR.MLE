\name{LFDR.MLE-package}
\alias{LFDR.MLE-package}
\alias{LFDR.MLE}
\docType{package}
\title{Estimation of the Local False Discovery Rate using Type II Maximum Likelihood Estimation.}
\description{
Suite of R functions for the estimation of the local false discovery rate (LFDR) using Type II maximum likelihood estimation (MLE).
}
\details{
\tabular{ll}{
Package: \tab LFDR.MLE\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-07-30\cr
License: \tab GPL-3\cr
Depends: \tab R (>= 2.14.0), stats, methods\cr
URL: \tab http://www.cran.r-project.org, http://www.statomics.com\cr
}
}
\author{
Code: Ye Yang, Marta Padilla, Zhenyu Yang, Zuojing Li, Corey M. Yanofsky\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla\cr
Maintainer: D. R. Bickel <dbickel@uOttawa.ca>
}
\references{
Yang, Y., & Bickel, D. R. (2010). Minimum description length and empirical Bayes methods of identifying SNPs associated with disease. Technical Report, Ottawa Institute of Systems Biology, COBRA Preprint Series, Article 74, available at biostats.bepress.com/cobra/ps/art74.

Bickel, D. R. (2010). Minimum description length methods of medium-scale simultaneous inference. arXiv preprint arXiv:1009.5981.

Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
}

\keyword{ package }
\keyword{ Local False Discovery Rate }
\keyword{ LFDR }
\keyword{ Maximum Likelihood Estimates }
\keyword{ Type II Maximum Likelihood Estimates }
\keyword{ Type II MLE }
\keyword{ LFDR-MLE  }
\keyword{ LFDR-L0O  }
\keyword{ LFDR-L1O  }
\keyword{ LFDR-LHO  }
\keyword{ LFDR-MDL  }

\examples{
dFUN<-dabsTd; dfx <- 4
n.alternative <- 3; n.null <- 4; true.ncp <- 7

#NOTE: arguments for dFUN are x, df, ncp. If dFUN has other arguments, 
#please adapt them. For example:
#dFUN<-function(x,df,ncp){dnorm(x=x,mean=ncp,sd=df)};attr(dFUN,'name')<-'dnorm'

#In the examples, W is the result of the absolute value of the t.test statistics 
#on the data

W<-abs(c(rt(n=n.alternative,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[c(1,3,5)]<-NA

z1<-lfdr.mle(x=W,dFUN=dFUN, df=dfx)
z2<-lfdr.mle(x=W,dFUN=dFUN, df=dfx,fixed.p0=0.4,fixed.ncp=4)
z3<-lfdr.mdl(x=W,df=dfx,dFUN=dFUN)
z4<-lfdr.l1o(x=W,df=dfx,dFUN=dFUN)
z5<-lfdr.lho(x=W,df=dfx,dFUN=dFUN,fixed.ncp=5)
z6<-lfdr.lo(x=W,v=1/3,df=dfx,dFUN=dFUN)
z7<-lfdr.mdlo(x=W,v=1/3,df=dfx,dFUN=dFUN)


\dontshow{W;str(z1);str(z2);str(z3);str(z4);str(z5);str(z6);str(z7)}
}