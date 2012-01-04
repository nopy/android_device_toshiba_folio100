$(call inherit-product, device/toshiba/folio100/full_folio100.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P7510 BUILD_ID=HTJ85B BUILD_FINGERPRINT=samsung/GT-P7510/GT-P7510:3.2/HTJ85B/UEKMM:user/release-keys PRIVATE_BUILD_DESC="GT-P7510-user 3.2 HTJ85B UEKMM release-keys"

PRODUCT_NAME := cm_folio100
PRODUCT_DEVICE := folio100
PRODUCT_MODEL := Folio 100
PRODUCT_BRAND := TOSHIBA
PRODUCT_MANUFACTURER := TOSHIBA
PRODUCT_RELEASE_NAME := folio100
