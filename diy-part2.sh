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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

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
