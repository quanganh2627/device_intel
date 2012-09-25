LOCAL_PATH := $(call my-dir)

# Plug-in library for AOSP updater
include $(CLEAR_VARS)
LOCAL_MODULE := libcommon_recovery
LOCAL_SRC_FILES := common_recovery.c
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_C_INCLUDES := bootable/recovery
LOCAL_CFLAGS := -Wall -Werror -Wno-unused-parameter
include $(BUILD_STATIC_LIBRARY)