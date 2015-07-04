*! Ryan Powers - November 2014
*! Modified from Nick Winter’s post here: http://www.stata.com/statalist/archive/2002-07/msg00179.html
*! syntax:  [by varlist:] egen newvar = scorr(var1 var2) [if exp] [in exp] 
*! computes Spearman’s Rank correlation coefficient  between var1 and var2, optionally by: varlist,
*! and stores the result in newvar.
program define _gscorr
	version 7

	gettoken type 0 : 0
	gettoken g    0 : 0
	gettoken eqs  0 : 0
	syntax varlist(min=2 max=2) [if] [in] [, BY(string) ]

	if `"`by'"'!="" {
		local by `"by `by':"'
	}

	quietly { 
		gen `type' `g' = .
		`by' GenSCorr `varlist' `if' `in', thevar(`g')

	}
	capture label var `g' "S Correlation `varlist'"
end

program define GenSCorr, byable(recall)
	syntax varlist [if] [in] , thevar(string) 
	marksample touse
	
	local stat "r(rho)"
	
	cap spearman `varlist' if `touse'
	if !_rc {
		qui replace `thevar'=``stat'' if `touse'
	}
end
