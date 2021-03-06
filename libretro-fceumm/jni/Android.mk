LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libretro
FCEU_SRC_DIRS := ../src-fceumm ../src-fceumm/boards ../src-fceumm/input ../src-fceumm/mappers

FCEU_SRC_FILES := $(wildcard $(LOCAL_PATH)/../src-fceumm/*.c) \
		$(wildcard $(LOCAL_PATH)/../src-fceumm/boards/*.c) \
		$(wildcard $(LOCAL_PATH)/../src-fceumm/input/*.c) \
		$(wildcard $(LOCAL_PATH)/../src-fceumm/mappers/*.c)

FCEU_SRC_FILES := $(FCEU_SRC_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES  = ../libretro-fceumm/libretro.c \
		../libretro-fceumm/memstream.c \
		$(FCEU_SRC_FILES)

LOCAL_CFLAGS = -DINLINE=inline -DSOUND_QUALITY=0 -DPATH_MAX=1024 -DPSS_STYLE=1 -DLSB_FIRST -D__LIBRETRO__ -DHAVE_ASPRINTF

include $(BUILD_SHARED_LIBRARY)
