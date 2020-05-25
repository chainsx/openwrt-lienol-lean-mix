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
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#get lean package
wget https://github.com/coolsnowwolf/lede/archive/20200408.tar.gz
tar -zxvf 20200408.tar.gz
cp -rfp lede-20200408/package/lean package
git clone https://github.com/chongteng2017/luci-app-passwall package/lean/luci-app-passwall
rm -rf 20200408*
