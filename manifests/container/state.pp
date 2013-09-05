define lxc::container::state(
    $state = 'running'
) {
    case $state {
        'running': {
            exec { "lxc-start -d -n ${name}":
                onlyif => "test `lxc-info -n ${name} 2>/dev/null |grep state | awk ' { print \$2 } '` != 'RUNNING'";
            }
        }
        'stopped': {
            exec { "lxc-stop -n ${name}":
                onlyif => "test `lxc-info -n ${name} 2>/dev/null |grep state | awk ' { print \$2 } '` != 'STOPPED'";
            }
        }
    }
}
