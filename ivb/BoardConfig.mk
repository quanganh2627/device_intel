# Board configuration for Ivy Bridge devices

include device/intel/pc_std/BoardConfig.mk

TARGET_ARCH_VARIANT := ivybridge

# The board name as known by Android SDK
TARGET_BOOTLOADER_BOARD_NAME := ivb

# Must be set to enable WPA supplicant build. WEXT is the driver for generic
# linux wireless extensions. NL80211 supercedes it.
# This variable is used by external/wpa_supplicant/Android.mk
BOARD_WPA_SUPPLICANT_DRIVER=NL80211
WPA_SUPPLICANT_VERSION:=VER_0_8_X

# set the wifi_driver_basename variable
include device/intel/pc_std/select_wifi_driver.mk

# Tells Android HAL how to load WIFI driver.
# See hardware/libhardware_legacy/wifi/{Android.mk,wifi.c}
WIFI_DRIVER_PROBE_PATH := /system/lib/modules/
WIFI_DRIVER_MODULE_NAME := $(wifi_driver_basename)
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/$(wifi_driver_basename).ko
# Workarounds for excessive errors that interfere with proper wifi
# operation in the IWLWIFI driver:
#
# plcp_check=N  Works around excessive PLCP health-check failures
#               that cause continuous resetting of RF
# 11n_disable=1 Works around excessive tx retransmits while 11n
#               is enabled, symptom: name-resolve failure
IWLWIFI_PARMLIST := \
	plcp_check=N \
	11n_disable=1 \

WIFI_DRIVER_MODULE_ARG := "$(strip $(IWLWIFI_PARMLIST))"
BOARD_HAVE_WIFI := true
ADDITIONAL_DEFAULT_PROPERTIES += wifi.interface=wlan0

# Product specific overlay - uncomment this if/when an overlay
# or part of an overlay needs to apply to this target only
PRODUCT_PACKAGE_OVERLAYS := device/intel/ivb/overlay

ADDITIONAL_BUILD_PROPERTIES += \
                               ro.camera.number=1 \
                               ro.camera.0.devname=/dev/video0 \
                               ro.camera.0.facing=front \
                               ro.camera.0.orientation=0 \

# end of file
