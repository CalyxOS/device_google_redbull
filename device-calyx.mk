DEVICE_PACKAGE_OVERLAYS += device/google/redbull/overlay-calyx

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display \
    vendor/qcom/opensource/display

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml \
    device/google/redbull/permissions/permissions_com.google.android.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/permissions_com.google.android.euicc.xml

# HBM
PRODUCT_COPY_FILES += \
    device/google/redbull/permissions/permissions_com.android.hbmsvmanager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions_com.android.hbmsvmanager.xml

TARGET_PREBUILT_KERNEL := device/google/redbull-kernel/vintf/Image.lz4

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# RCS
PRODUCT_PACKAGES += \
    PresencePolling \
    RcsService

# Touch
include hardware/google/pixel/touch/device.mk

# Build necessary packages for vendor

# CHRE
PRODUCT_PACKAGES += \
    chre

# GNSS
PRODUCT_PACKAGES += \
    flp.conf

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# VNDK FWK detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    libwifi-hal-ctrl:64 \
    libwifi-hal-qcom

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop
