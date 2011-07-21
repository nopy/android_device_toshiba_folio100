$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/nvidia/betelgeuse/init.betelgeuse.rc:root/init.betelgeuse.rc \
    device/nvidia/betelgeuse/ueventd.tegra.rc:root/ueventd.tegra.rc

# Place wifi files
#PRODUCT_COPY_FILES += \
#    device/nvidia/betelgeuse/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
#    device/nvidia/betelgeuse/wifi/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf

    #device/nvidia/betelgeuse/wifi/bcm4329.ko:system/lib/hw/wlan/bcm4329.ko \
# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
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
    $(LOCAL_PATH)/initlogo.rle:root/initlogo.rle

$(call inherit-product-if-exists, vendor/nvidia/betelgeuse/betelgeuse-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/nvidia/betelgeuse/overlay

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
        $(LOCAL_PATH)/etc/vold.betelgeuse.fstab:system/etc/vold.fstab

# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml

# init.d script
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/99postboot:system/etc/init.d/99postboot

# Kernel
ifndef BUILD_KERNEL
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/nvidia/betelgeuse/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1

$(call inherit-product, build/target/product/full.mk)
# Added all the kernel modules to be copyed
$(call inherit-product-if-exists, device/nvidia/betelgeuse/KernelModules.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_betelgeuse
PRODUCT_DEVICE := betelgeuse
