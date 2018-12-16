OpenWRT configuraiton templates
=========================================

wrtac_ip4
--------------------------------

**Linksys** `wrt1200ac`, `wrt1900acs`, `wrt3200acm`

### Features ###

* dnsmasq is replaced by **unbound** and **isc-dhcpd**
* Including [rsnapshot-ng](https://github.com/AenonDynamics/rsnapshot-ng) dependencies (`perl5`, `rsync`)
* **minidlna** media server
* **openvpn** client/server
* **samba** server
* Filesystem utilities `hdparm`, `fdisk`, `marvell sata`, `usb3 storage`, `usb2 storage`, `ext4`
* System utilities `coreutils-base64`
* Network utilities `iftop`, `rsync`, `curl`
* Removed `ppp`