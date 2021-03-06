LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_USE_DROIDBOOT),true)
# Plug-in libary for Droidboot
include $(CLEAR_VARS)
LOCAL_MODULE := libdbadbd
LOCAL_SRC_FILES := dbadbd.c
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_C_INCLUDES := bootable/droidboot
LOCAL_CFLAGS := -Wall -Werror -Wno-unused-parameter
ifneq ($(DROIDBOOT_NO_GUI),true)
LOCAL_CFLAGS += -DUSE_GUI
endif
include $(BUILD_STATIC_LIBRARY)
endif # TARGET_USE_DROIDBOOT

