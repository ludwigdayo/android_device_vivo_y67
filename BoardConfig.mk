#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/vivo/y67

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

BOARD_FLASH_BLOCK_SIZE := 4096

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_MTK_AUDIO := true
#使用旧版音频政策格式
USE_XML_AUDIO_POLICY_CONF := 0

# Bootloader
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_CONNECTIVITY_MODULE := conn_soc
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera and Codecs
BOARD_GLOBAL_CFLAGS += -DMETADATA_CAMERA_SOURCE
#while TARGET_HAS_LEGACY_CAMERA_HAL1 := true will build cameraserver in mediaserver
#but it let photo quality decrease and could't open hdr, so we cast away it
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
USE_CAMERA_STUB := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.5.0

# FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6755

# GPS
BOARD_MEDIATEK_USES_GPS := true
BOARD_GPS_LIBRARIES := true
USE_PREBUILD_GPS_BLOB := yes

# Include
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Kernel informations
ENFORCE_SELINUX := true
ifeq ($(ENFORCE_SELINUX), true)
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
else
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
endif
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --board 1465391499 --ramdisk_offset 0x04f88000 --second_offset 0x00e88000 --tags_offset 0x03f88000
TARGET_USES_64_BIT_BINDER := true

USE_PREBUILT_KERNEL := true

ifeq ($(USE_PREBUILT_KERNEL), true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
else
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/vivo/y67
TARGET_KERNEL_CONFIG := pd1612_defconfig
endif

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 32777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 402984832
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3029848320
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32879521280
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Mediatek support
BOARD_HAS_MTK_HARDWARE := true
MTK_MEDIA_PROFILES := true
BOARD_USES_MTK_MEDIA_PROFILES := true
BOARD_USES_MTK_HARDWARE := true

# Media
TARGET_OMX_LEGACY_RESCALING := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true

# Misc
EXTENDED_FONT_FOOTPRINT := true

# OTA
BLOCK_BASED_OTA := false

# Platform
TARGET_BOARD_PLATFORM := mt6750
TARGET_BOOTLOADER_BOARD_NAME := y67

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := y67,pd1612,PD1612MD,PD1612CMD,PD1612C

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
BOARD_RIL_CLASS := $(DEVICE_PATH)/ril

# Sensors
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
POLICYVERS := 29

# Symbols
TARGET_LDPRELOAD += libmtk_symbols.so:libxlog.so

# use linker to load libcamera_client.so, this blob from vivo and it has vivo official modify
LINKER_FORCED_SHIM_LIBS := /system/lib/libcam_mmp.so|libcamera_symbol.so:/system/lib64/libcam_mmp.so|libcamera_symbol.so

# System
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Twrp
ifeq ($(TARGET_RECOVERY_VERSION_TWRP), true)
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
TW_USE_LOCAL_BINARY := true
TW_CUSTOM_UPDATE_BLOB := true
TW_INCLUDE_L_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := true
TW_DEFAULT_BRIGHTNESS := 30
TW_EXCLUDE_TWRPAPP := true
TW_MAX_BRIGHTNESS := 255
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := zh_CN
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_SUPERSU := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
PRODUCT_COPY_FILES += $(DEVICE_PATH)/rootdir/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab
endif

# Wireless
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
