#!/system/bin/sh

# This script is started from /init.rc.
# Put any "late initialization" in here.
# Sleeps are ok... but don't put anything in this file that
# could possibly go into init.<platform>.rc

# Bring up Ethernet (over USB) interface, for testing/debugging.
case `getprop ro.debuggable` in
1)
    eth0=1

    # Wait for eth0 to be up
    count=0
    while [ ! -e /sys/class/net/eth0 ]; do
        count=$((count+1))
        if [ $count -gt 30 ]; then
            eth0=0
            break
        fi
        sleep 2
    done

    # set ip address only if eth0 is up
    if [ "$eth0" == "1" ]; then
        # if property net.eth0.ip is defined, use it as ip address for eth0
        # else use dhcp
        use_static=Y
        addr=`getprop net.eth0.ip`
        netmask=`getprop net.eth0.netmask`

        if [ -z "$addr" -o -f /mnt/sdcard/use_dhcp ]; then
            use_static=N
        fi

        case $use_static in
        Y)
            ifconfig eth0 $addr netmask $netmask up
            ;;
        N)
            # Bring up eth0 using netcfg with dhcp.
            # If the ethernet cable is not plugged in, this could hang for a long time.
            # So do it in a background shell.
            netcfg eth0 dhcp &
            ;;
        esac # use_static

    fi # eth0 == 1
    ;;
esac # ro.debuggable

exit 0
