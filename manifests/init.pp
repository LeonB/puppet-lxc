class lxc(
	$packages = params_lookup( 'packages' ),
	$enabled  = params_lookup( 'enabled' ),
  ) inherits lxc::params {

  	$ensure = $enabled ? {
  		true => present,
  		false => absent
  	}

	include lxc::package, lxc::config, lxc::service
}
