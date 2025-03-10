# Hey Emacs, use -*- Tcl -*- mode

package require cmdline 1.5

namespace eval ::testin {
    
}

proc ::testin::intlist {args} {
    # Return a list of increasing integers starting with start with
    # length points
    #
    # Arguments:
    #   first -- First integer in the list
    #   length -- Number of integers in the list
    set myoptions {
	{first.arg 0 "First integer"}
	{length.arg 10 "Length of the list"}
    }
    array set arg [::cmdline::getoptions args $myoptions]

    set count 0
    set intlist [list]
    while { [llength $intlist] < $arg(length) } {
	    lappend intlist [expr $arg(first) + $count]
	    incr count
	}
    return $intlist
}

# Finally, provide the package
package provide testin 1.4
