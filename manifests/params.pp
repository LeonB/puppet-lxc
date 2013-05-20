# Class: lxc::params
#
# This class defines default parameters used by the main module class lxc
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to lxc class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class lxc::params {

	### Application related parameters

	$packages = $::operatingsystem ? {
		default => ['lxc']
	}

	$enabled = true

}
