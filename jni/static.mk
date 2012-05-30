#
# libRocket 1.2.1-custom prebuilt shared C++ library
#

__WAS_PATH := $(LOCAL_PATH)

PWD_PATH := $(call my-dir)

ifeq ($(FT2_ROOT),)
FT2_ROOT := $(PWD_PATH)/../../libfreetype2
endif

include $(FT2_ROOT)/jni/static.mk

LOCAL_PATH := $(PWD_PATH)

include $(CLEAR_VARS)

LOCAL_MODULE := rocket_prebuilt_static
LOCAL_SRC_FILES := ../obj/local/$(TARGET_ARCH_ABI)/librocket.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../Include
LOCAL_STATIC_LIBRARIES := freetype2_prebuilt_static

include $(PREBUILT_STATIC_LIBRARY)

LOCAL_PATH := $(__WAS_PATH)
