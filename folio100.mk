#
# Copyright (C) 2011 The Android Open-Source Project
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

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    net.qtaguid_enabled=false \
    wifi.interface=wlan0 \
    keyguard.no_require_sim=true \
    wifi.supplicant_scan_interval=45 \
    ro.opengles.version=131072 \
    ro.kernel.android.checkjni=0

# Media properties ( from stock )
PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.dec.vid.wmv.enabled=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.enc.hprof.file.format=3gp \
    ro.media.enc.hprof.aud.hz=44100 \
    ro.media.enc.hprof.aud.ch=2 \
    ro.media.enc.hprof.codec.aud=aac \
    ro.media.enc.hprof.aud.bps=128000 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true 

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/toshiba/folio100/init.folio100.rc:root/init.folio100.rc \
    device/toshiba/folio100/ueventd.folio100.rc:root/ueventd.folio100.rc

# Some files for 3G
PRODUCT_COPY_FILES += \
    device/toshiba/folio100/etc/ppp/ip-up:system/etc/ppp/ip-up \
    device/toshiba/folio100/etc/ppp/ip-down:system/etc/ppp/ip-down

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

# we have enough storage to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Keychars
# Keylayout
# idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keychars/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
    $(LOCAL_PATH)/keychars/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
    $(LOCAL_PATH)/keychars/nvec_cir.kcm:system/usr/keychars/nvec_cir.kcm \
    $(LOCAL_PATH)/keychars/nvec_keyboard.kcm:system/usr/keychars/nvec_keyboard.kcm \
    $(LOCAL_PATH)/keychars/tegra-kbc.kcm:system/usr/keychars/tegra-kbc.kcm \
    $(LOCAL_PATH)/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/nvec_cir.kl:system/usr/keylayout/nvec_cir.kl \
    $(LOCAL_PATH)/keylayout/nvec_keyboard.kl:system/usr/keylayout/nvec_keyboard.kl \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/nvodm_touch.idc:system/usr/idc/nvodm_touch.idc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/ar3k/30101/PS_ASIC.pst:/system/wifi/ar3k/30101/PS_ASIC.pst \
    $(LOCAL_PATH)/wifi/ar3k/30101/RamPatch.txt:/system/wifi/ar3k/30101/RamPatch.txt \
    $(LOCAL_PATH)/wifi/ar3k/30101coex/PS_ASIC.pst:/system/wifi/ar3k/30101coex/PS_ASIC.pst \
    $(LOCAL_PATH)/wifi/ar3k/30101coex/RamPatch.txt:/system/wifi/ar3k/30101coex/RamPatch.txt \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:/system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/data.patch.bin:/system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:/system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:/system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:/system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    $(LOCAL_PATH)/wifi/ath6k/AR6003/hw2.0/bdata.WB31.bin:/system/wifi/ath6k/AR6003/hw2.0/bdata.WB31.bin \
    $(LOCAL_PATH)/wifi/libhuawei-ril.so:/system/lib/libhuawei-ril.so

$(call inherit-product-if-exists, vendor/toshiba/folio100/folio100-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/toshiba/folio100/overlay

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

PRODUCT_CHARACTERISTICS := tablet

# Include packages
PRODUCT_PACKAGES += \
    librs_jni \
    SpareParts \
    gralloc.tegra \
    overlay.tegra \
    lights.tegra \
    sensors.tegra \
    screencap \
    abtfilt \
    wmiconfig \
    audio.primary.tegra \
    liba2dp \
    hwprops \
    hostap

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs


# VOLD
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/etc/vold.folio100.fstab:system/etc/vold.fstab

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

$(call inherit-product-if-exists, vendor/toshiba/folio100/folio100-vendor.mk)
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/AR6kSDK.3.0/host/device-ath6k.mk)


 
