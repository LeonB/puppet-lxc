# Ensures, that a container is destroyed
define lxc::container::destroy() {
    exec { "lxc-destroy -f -n ${name}":
        onlyif => "test -d /var/lib/lxc/${name}",
        require => Class[ 'lxc::install' ];
    }
}
