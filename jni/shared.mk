#
# libRocket 1.2.1-custom prebuilt shared C++ library
#

__WAS_PATH := $(LOCAL_PATH)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := rocket_prebuilt_shared
LOCAL_SRC_FILES := ../libs/$(TARGET_ARCH_ABI)/librocket.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../Include

include $(PREBUILT_SHARED_LIBRARY)

LOCAL_PATH := $(__WAS_PATH)
