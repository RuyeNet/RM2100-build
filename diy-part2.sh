#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# WIFI ON
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default theme
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile

# luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git  package/diy/luci-theme-argon

# openclash
wget -P package/diy/openclash -c https://github.com/vernesong/OpenClash/archive/refs/heads/master.zip
unzip -o package/diy/openclash/master.zip  -d package/diy/openclash/

# 编译 po2lmo
pushd package/diy/openclash/OpenClash-master/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
# cd $GITHUB_WORKSPACE/openwrt

# luci-app-aliddns
git clone https://github.com/chenhw2/luci-app-aliddns.git  package/diy/luci-app-aliddns
