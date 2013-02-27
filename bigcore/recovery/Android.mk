LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := bigcore_device.cpp
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := bootable/recovery
LOCAL_MODULE := libbigcore_recovery_ui
LOCAL_CFLAGS := -Wall
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := bigcore_edify.c
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := bootable/recovery bootable/iago/include
LOCAL_MODULE := libbigcore_updater
LOCAL_CFLAGS := -Wall -Werror
include $(BUILD_STATIC_LIBRARY)

