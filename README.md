
#``egen scorr()``
This small program extends the ``egen`` command in Stata. It calculates the Spearman's rank correlation coefficient between two variables using the ``egen`` command and stores it in a new variable. This is most useful when combined with the ``by:`` or ``bysort:`` syntax.

##To Install
Place the \_gscorr.ado file in your user ado directory (e.g, ~/Library/Application Support/Stata/plus/ado/_).

##Syntax
To generate a new variable called ``varname`` that stores the Spearman's Rank correlation coefficient between two variables use:

	egen newvar = scorr(existingvar1 existingvar2)

You can optionally--and perhaps most usefully--combine this command with the ``by:`` or ``bysort:`` syntax:

	by A: B = scorr(existingvar1 existingvar1)
	bysort A: B = scorr(existingvar1 existingvar1)

##Credit
This extension is a minimally modified version of a program posted by [Nicholas Winter](mailto:nwinter[at]virginia.edu) on the Stata mailinglist on [July 10, 2002](http://www.stata.com/statalist/archive/2002-07/msg00179.html). 

Last modified: July 2015.

