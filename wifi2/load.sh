#!/bin/sh
insmod /system/wifi2/compat/compat.ko
insmod /system/wifi2/compat/compat_firmware_class.ko
insmod /system/wifi2/net/wireless/cfg80211.ko
insmod /system/wifi2/net/wireless/lib80211_crypt_ccmp.ko
insmod /system/wifi2/net/wireless/lib80211_crypt_tkip.ko
insmod /system/wifi2/net/wireless/lib80211_crypt_wep.ko
#insmod /system/wifi2/drivers/staging/ath6kl.ko
