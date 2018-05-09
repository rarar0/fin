Our group has decided to use Dnsmasq for our netboot needs. It provides built in DNS services, as well as DHCP servers and read only TFTP services

My first step was installing dnsmasq, which was a breeze using "apt-get install dnsmasq"

I then followed the guide at https://docs.oracle.com/cd/E37670_01/E41137/html/ol-dnsmasq-conf.html

The first step I followed was to edit the dnsmasq.conf file with the following parameters

interface=eth1

dhcp-range=10.0.0.200,static,infinite

dhcp-boot=pxelinux/pxelinux.0

enable-tftp

tftp-root=/var/lib/tftpboot

The line dhcp-range=10.0.0.200,static,infinite gives us a static IP to work with for our DHCP needs

The line tftp-root=/var/lib/tftpboot Specifies the root directory for files served by TFTP. (which you must create, using mkdir -p /var/lib/tftpboot/pxelinux/pxelinux.cfg)

The last step I completed was creating a firewall using the iptables command, specifically:

iptables -I INPUT -i eth1 -p udp --dport 67:68 --sport 67:68 -j ACCEPT (for DHCP)

iptables -I INPUT -i eth1 -p udp --dport 69 -j ACCEPT (for TFTP)

I then installed the iptables-persistent package to make these rules persist on machine startup.

Remaining steps are: 

1) Starting the dnsmasq service and working out kinks

2) Getting the install files on the server and ready to send.
