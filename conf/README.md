OpenWRT configuraiton templates
=========================================

wrtac_ip4
--------------------------------

**Linksys** `wrt1200ac`, `wrt1900acs`, `wrt3200acm`

### Features ###

* `ipv4** **ONLY**
* dnsmasq is replaced by **unbound** and **isc-dhcpd**
* Including [rsnapshot-ng](https://github.com/AenonDynamics/rsnapshot-ng) dependencies (`perl5`, `rsync`)
* **minidlna** media server
* **openvpn** client/server
* **samba** server
* Filesystem utilities `hdparm`, `fdisk`, `rsync`, `marvell sata`, `usb3 storage`, `usb2 storage`, `ext4`
* System utilities `coreutils-base64`
* Network utilities `dig`, `iftop`, `curl`, `wget`, `ca-certificates`, `iptables-raw`, `nflog`, `ulogd-nflog`, `ulogd-mysql`
* Removed `ppp`