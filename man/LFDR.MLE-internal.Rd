\name{internals}
\alias{internals}
\alias{est.lfdrmle-class}
\alias{as.numeric-methods}
\alias{as.numeric,est.lfdrmle-method}
\alias{[,est.lfdrmle,ANY,missing-method}
\alias{is_prob,est.lfdrmle-method}
\alias{length,est.lfdrmle-method}
\alias{names,est.lfdrmle-method}
\alias{names<-,est.lfdrmle,character-method}
\alias{is_prob-methods}
\alias{is_prob,numeric-method}
\alias{length-methods}
\alias{names-methods}
\alias{names<--methods}
\alias{[-methods}
\alias{MakeNames}
\alias{are}
\alias{are_null}
\alias{are_prob}

\alias{assert.are}
\alias{assert.is}
\alias{est2list}
\alias{get_groups}
\alias{get_n.groups}
\alias{get_null.groups}
\alias{get_null.n.groups}
\alias{get_simulated_W}
\alias{is_any}
\alias{is_err}
\alias{is_error}
\alias{is_unk}
\alias{is_vide}
\alias{is_prob}

\alias{lfdr.hats}
\alias{make_labels}

\alias{new_est.lfdrmle}
\alias{nsize}
\alias{rFUN_generator}
\alias{sameAsX_names}
\alias{simulated_W}
\alias{vect2string}
\alias{vectorized.dabsTd}
\alias{ye.mle}

\alias{[}

\alias{as.numeric}
\alias{length}
\alias{names} 
\title{Internal Functions and Methods}
\description{
These functions are for internal use and/or for upcoming packages or not yet documented.
}
\usage{
MakeNames(x, nmvar = c("X", "I"), ...)
are(object, class2)
	are_null(object)
are_prob(object, ...)

assert.are(object, class2,
	 ...)
assert.is(object, class2, text = "")
est2list(x)
	get_groups(n.features, n.null, n.groups)
get_n.groups(n.features, n.null,
	 group.size)
get_null.groups(n.null, null.n.groups)
get_null.n.groups(n.null,
	 null_group.size)
get_simulated_W(n.features, true.p0, list.ncp1,
	 rFUN, df)
is_any(object, class2)
is_err(object)
is_error(object)
	is_unk(object)
is_vide(object)


lfdr.hats(stat = NULL, lfdr.fun = "lfdr.mle",
	 dFUN = dabsTd, lower.ncp = 0.001, upper.ncp = 20, lower.p0 = 0,
	 upper.p0 = 1, fixed.p0 = NULL, fixed.ncp = NULL, d0 = 0, v = 1,
	 w = 1, ...)
make_labels(n, nmvar = c("X"), n.ini = 1)


new_est.lfdrmle(LFDR.hat,
	 p0.hat, ncp.hat, stat, method = NULL, info = list())
nsize(x)
rFUN_generator(base_rFUN, ...)
sameAsX_names(x = NULL, y = NULL)
simulated_W(n.features, n.null, rFUN = rFUN_generator(rchisq), true.ncp1, df,
	 N = (n.features - n.null), sided = ifelse(identical(rFUN,
	 rFUN_generator(rchisq)), 1, 2), logic = TRUE)
vect2string(x, sep = "", ...)
	vectorized.dabsTd(ncp, ...)
ye.mle(W, df, dFUN = dabsTd, lower.ncp = 0.001,
	 upper.ncp = 20, lower.p0 = 0, upper.p0 = 1, d0 = 0, fixed.ncp = NULL,
	 fixed.p0 = NULL, ...)
}
\keyword{internal}

