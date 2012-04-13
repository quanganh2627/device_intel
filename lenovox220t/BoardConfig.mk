# Board configuration for Intel PC STD platform

include device/intel/pc_std/BoardConfig.mk

# The board name as known by Android SDK
TARGET_BOOTLOADER_BOARD_NAME := lenovox220t

# Composes a kernel command line which will be used by build/core/Makefile when
# setting up the boot environment.  androidboot.{bootmedia,hardware} are used
# to search for init.*.rc files during init.
# Note that "subarch" numbers are derived from the kernel include file
# arch/x86/include/asm/bootparam.h
BOARD_KERNEL_CMDLINE_FILE := device/intel/lenovox220t/cmdline
BOARD_KERNEL_CMDLINE := $(shell cat $(BOARD_KERNEL_CMDLINE_FILE))

# Kernel command line for installer. USB is hardcoded. This variable is used as
# part of the arguments for external/genext2fs/mkbootimg_ext2.sh.
TARGET_INSTALLER_BOOTMEDIA = usb

# Must be set to enable WPA supplicant build. WEXT is the driver for generic
# linux wireless extensions. NL80211 supercedes it.
# This variable is used by external/wpa_supplicant/Android.mk
BOARD_WPA_SUPPLICANT_DRIVER=NL80211
WPA_SUPPLICANT_VERSION:=VER_0_8_X

# Tells Android HAL how to load WIFI driver.
# See hardware/libhardware_legacy/wifi/{Android.mk,wifi.c}
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/iwlagn.ko
WIFI_DRIVER_MODULE_NAME := iwlagn
WIFI_DRIVER_MODULE_ARGS := 
BOARD_HAVE_WIFI := true

ADDITIONAL_DEFAULT_PROPERTIES += wifi.interface=wlan0

# Product specific overlay - uncomment this if/when an overlay
# or part of an overlay needs to apply to this target only
PRODUCT_PACKAGE_OVERLAYS := device/intel/lenovox220t/overlay