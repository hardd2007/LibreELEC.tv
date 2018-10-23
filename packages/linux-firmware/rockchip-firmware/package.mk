# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rockchip-firmware"
PKG_VERSION="firmware"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/rockchip-linux"
PKG_URL=""
PKG_DEPENDS_TARGET="rkbin rfkill"
PKG_SECTION="firmware"
PKG_SHORTDESC="rockchip firmware"
PKG_LONGDESC="rockchip firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/libreelec

  mkdir -p $INSTALL/usr/bin
    cp -v $(get_build_dir rkbin)/firmware/bin/rtk_hciattach $INSTALL/usr/bin
    cp -v $(get_build_dir rkbin)/firmware/bin/brcm_patchram_plus $INSTALL/usr/bin

  mkdir -p $INSTALL/$(get_full_firmware_dir)/rtlbt
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/rtl8723b_* $INSTALL/$(get_full_firmware_dir)/rtlbt

  mkdir -p $INSTALL/$(get_full_firmware_dir)/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4354A2.hcd $INSTALL/$(get_full_firmware_dir)/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm4356a2_ag.bin $INSTALL/$(get_full_firmware_dir)/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6356.txt $INSTALL/$(get_full_firmware_dir)/brcm
    #skykirin x99 ap6255
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4345C0.hcd $INSTALL/$(get_full_firmware_dir)/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm43455c0_ag.bin $INSTALL/$(get_full_firmware_dir)/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6255.txt $INSTALL/$(get_full_firmware_dir)/brcm

  mkdir -p $INSTALL/$(get_full_firmware_dir)/rockchip
    cp -v $(get_build_dir rkbin)/firmware/rockchip/dptx.bin $INSTALL/$(get_full_firmware_dir)/rockchip
}
post_install() {
  enable_service brcmpatchram.service
}
