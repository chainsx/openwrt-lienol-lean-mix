#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

cat <<EOF >> patch.sh
wget https://github.com/melsem/openwrt-lede_xradio-xr819_soc-audio/raw/master/packages_xradio-OpenWrt-master/add-patch_dts_file-wifi-xradio.patch
patch -p1 < add-patch_dts_file-wifi-xradio.patch | y

wget https://github.com/melsem/openwrt-lede_xradio-xr819_soc-audio/raw/master/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master-4.19/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master.patch
patch -p1 < add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master.patch

https://github.com/melsem/openwrt-lede_xradio-xr819_soc-audio/raw/master/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master-4.19/add-on_wifi-mac80211.patch
patch -p1 < add-on_wifi-mac80211.patch
EOF
