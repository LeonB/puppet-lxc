# Ensures, that a container exists
# @param string $template template name to use
# @param string $vgname   volume group name to use
# @param int    $lvsize   logical volume size in GB
define lxc::container::create(
    $template,
    $vgname,
    $lvsize,
    $filesystem = 'ext4'
) {
    exec { "lxc-create -n ${name} -t ${template} -B lvm --lvname ${name} --vgname ${vgname} --fstype ${filesystem} --fssize ${lvsize}G":
        onlyif  => "test ! -d /var/lib/lxc/${name}",
        require => Class['lxc'];
    }
}
