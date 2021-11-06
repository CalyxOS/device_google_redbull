#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.lz4
ifeq ($(INLINE_KERNEL_BUILDING),true)
KERNEL_LD := LD=ld.lld
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := redbull_defconfig
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),barbet)
TARGET_KERNEL_SOURCE := kernel/google/barbet
else
TARGET_KERNEL_SOURCE := kernel/google/redbull
endif
TARGET_NEEDS_DTBOIMAGE := true

# Kernel modules
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),barbet)
KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/barbet/modules.load))
else
KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/redbull/modules.load))
endif
KERNEL_MODULES_LOAD := $(foreach m,$(KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(filter-out $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(filter $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))
endif

# Properties
TARGET_VENDOR_PROP += device/google/redbull/vendor.prop
