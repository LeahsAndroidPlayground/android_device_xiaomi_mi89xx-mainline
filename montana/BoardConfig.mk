#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi89xx-mainline/BoardConfig.mk

# A/B
AB_OTA_UPDATER := false

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=mi89x7

# Kernel
TARGET_KERNEL_SOURCE := kernel/mainline/msm89x7-mainline

TARGET_DTB_LIST_WILDCARD := \
    qcom/msm8937-motorola-montana*

TARGET_KERNEL_CONFIG_EXT := \
    $(TARGET_DEVICE_PATH)/kconfigs/config-postmarketos-qcom-msm89x7.aarch64 \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/b/android-6.12/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.power_supply)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

TARGET_AUTO_COLLECT_KERNEL_MODULE_DEPS := true

# OTA
TARGET_OTA_ASSERT_DEVICE := montana

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE              := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE           := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE             := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE          := 30552437 # Fake size! Real on-device partition is 16879616.

# VENDOR
# Commented out since we don't have vendor on montana!
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE          := ext4
#BOARD_VENDORIMAGE_EXTFS_INODE_COUNT         := 4096
#BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE   := 419430400
#TARGET_COPY_OUT_VENDOR := vendor

# SYSTEM
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE          := ext4
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT         := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE   := 2516582400

BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.mi89x7
