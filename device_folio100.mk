$(call inherit-product, build/target/product/small_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := full_folio100
PRODUCT_DEVICE := folio100

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    dalvik.vm.dexopt-data-only=1

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/toshiba/folio100/init.folio100.rc:root/init.folio100.rc \
    device/toshiba/folio100/ueventd.tegra.rc:root/ueventd.tegra.rc

# Some files for 3G
PRODUCT_COPY_FILES += \
    device/toshiba/folio100/etc/ppp/ip-up:system/etc/ppp/ip-up \
    device/toshiba/folio100/etc/ppp/ip-down:system/etc/ppp/ip-down

# Place wifi files
#PRODUCT_COPY_FILES += \
#    device/toshiba/folio100/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
#    device/toshiba/folio100/wifi/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf

    #device/toshiba/folio100/wifi/bcm4329.ko:system/lib/hw/wlan/bcm4329.ko \
# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml
    $(LOCAL_PATH)/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/ar6000.ko:system/lib/hw/wlan/ar6000.ko \
    $(LOCAL_PATH)/wifi/wpa_supplicant:system/wifi/wpa_supplicant \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/usbtest.ko:system/wifi/usbtest.ko \
    $(LOCAL_PATH)/wifi/ar3k/30101/PS_ASIC.pst:/system/wifi/ar3k/30101/PS_ASIC.pst \
    $(LOCAL_PATH)/wifi/ar3k/30101/RamPatch.txt:/system/wifi/ar3k/30101/RamPatch.txt \
    $(LOCAL_PATH)/wifi/ar3k/30101coex/PS_ASIC.pst:/system/wifi/ar3k/30101coex/PS_ASIC.pst \
    $(LOCAL_PATH)/wifi/ar3k/30101coex/RamPatch.txt:/system/wifi/ar3k/30101coex/RamPatch.txt \
    $(LOCAL_PATH)/wifi/ar6000.ko:/system/wifi/ar6000.ko \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:/system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/data.patch.bin:/system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:/system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:/system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:/system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/bdata.WB31.bin:/system/wifi/ath6k/AR6003/hw2.0/bdata.WB31.bin \
    $(LOCAL_PATH)/wifi/libhuawei-ril.so:/system/lib/libhuawei-ril.so \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/default.prop:root/default.prop \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle

$(call inherit-product-if-exists, vendor/toshiba/folio100/folio100-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/toshiba/folio100/overlay

# Include packages
PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.default \
    gralloc.tegra \
    overlay.tegra \
    lights.tegra \
    sensors.tegra \
    screencap \
    abtfilt \
    wmiconfig \
    hostap

# Use MDPI artwork
PRODUCT_LOCALES += mdpi

# VOLD
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/etc/vold.folio100.fstab:system/etc/vold.fstab

# APNs
PRODUCT_COPY_FILES += \
	vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml

# init.d script
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/99postboot:system/etc/init.d/99postboot

# Kernel
ifndef BUILD_KERNEL
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/toshiba/folio100/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif

#$(call inherit-product, build/target/product/full.mk)
# Added all the kernel modules to be copyed
$(call inherit-product-if-exists, device/toshiba/folio100/KernelModules.mk)
