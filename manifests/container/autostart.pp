define lxc::container::autostart(
    $autostart = true
) {
    if $autostart {
        $ensure = symlink
        $target = "/var/lib/lxc/${name}/config"
    } else {
        $ensure = absent
        $target = undef
    }

    file { "/etc/lxc/auto/${name}":
        ensure  => $ensure,
        target  => $target;
    }
}
