# Kernel Modules TO BE COPIED
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.usbmap:/system/lib/modules/2.6.32.9/modules.usbmap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.inputmap:/system/lib/modules/2.6.32.9/modules.inputmap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.softdep:/system/lib/modules/2.6.32.9/modules.softdep \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.symbols:/system/lib/modules/2.6.32.9/modules.symbols \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.isapnpmap:/system/lib/modules/2.6.32.9/modules.isapnpmap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.alias:/system/lib/modules/2.6.32.9/modules.alias \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ofmap:/system/lib/modules/2.6.32.9/modules.ofmap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.order:/system/lib/modules/2.6.32.9/modules.order \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.alias.bin:/system/lib/modules/2.6.32.9/modules.alias.bin \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.symbols.bin:/system/lib/modules/2.6.32.9/modules.symbols.bin \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ccwmap:/system/lib/modules/2.6.32.9/modules.ccwmap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.dep:/system/lib/modules/2.6.32.9/modules.dep \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ieee1394map:/system/lib/modules/2.6.32.9/modules.ieee1394map \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.dep.bin:/system/lib/modules/2.6.32.9/modules.dep.bin \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.devname:/system/lib/modules/2.6.32.9/modules.devname \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.seriomap:/system/lib/modules/2.6.32.9/modules.seriomap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.pcimap:/system/lib/modules/2.6.32.9/modules.pcimap \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/mac80211/mac80211.ko:/system/lib/modules/2.6.32.9/kernel/net/mac80211/mac80211.ko \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/wireless/cfg80211.ko:/system/lib/modules/2.6.32.9/kernel/net/wireless/cfg80211.ko \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/usb/misc/usbtest.ko:/system/lib/modules/2.6.32.9/kernel/drivers/usb/misc/usbtest.ko \
    $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/scsi/scsi_wait_scan.ko:/system/lib/modules/2.6.32.9/kernel/drivers/scsi/scsi_wait_scan.ko

#PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.usbmap:/system/lib/modules/2.6.32.9/modules.usbmap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.inputmap:/system/lib/modules/2.6.32.9/modules.inputmap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.softdep:/system/lib/modules/2.6.32.9/modules.softdep \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.symbols:/system/lib/modules/2.6.32.9/modules.symbols \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/mac80211/mac80211.ko:/system/lib/modules/2.6.32.9/kernel/net/mac80211/mac80211.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/wireless/cfg80211.ko:/system/lib/modules/2.6.32.9/kernel/net/wireless/cfg80211.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/bnep/bnep.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/bnep/bnep.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/hidp/hidp.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/hidp/hidp.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/rfcomm/rfcomm.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/rfcomm/rfcomm.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/sco.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/sco.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/l2cap.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/l2cap.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/net/bluetooth/bluetooth.ko:/system/lib/modules/2.6.32.9/kernel/net/bluetooth/bluetooth.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/usb/misc/usbtest.ko:/system/lib/modules/2.6.32.9/kernel/drivers/usb/misc/usbtest.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/scsi/scsi_wait_scan.ko:/system/lib/modules/2.6.32.9/kernel/drivers/scsi/scsi_wait_scan.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/bluetooth/btsdio.ko:/system/lib/modules/2.6.32.9/kernel/drivers/bluetooth/btsdio.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/bluetooth/btusb.ko:/system/lib/modules/2.6.32.9/kernel/drivers/bluetooth/btusb.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/kernel/drivers/bluetooth/hci_uart.ko:/system/lib/modules/2.6.32.9/kernel/drivers/bluetooth/hci_uart.ko \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.isapnpmap:/system/lib/modules/2.6.32.9/modules.isapnpmap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.alias:/system/lib/modules/2.6.32.9/modules.alias \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ofmap:/system/lib/modules/2.6.32.9/modules.ofmap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.order:/system/lib/modules/2.6.32.9/modules.order \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.alias.bin:/system/lib/modules/2.6.32.9/modules.alias.bin \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.symbols.bin:/system/lib/modules/2.6.32.9/modules.symbols.bin \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ccwmap:/system/lib/modules/2.6.32.9/modules.ccwmap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.dep:/system/lib/modules/2.6.32.9/modules.dep \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.ieee1394map:/system/lib/modules/2.6.32.9/modules.ieee1394map \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.dep.bin:/system/lib/modules/2.6.32.9/modules.dep.bin \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.devname:/system/lib/modules/2.6.32.9/modules.devname \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.seriomap:/system/lib/modules/2.6.32.9/modules.seriomap \
#     $(LOCAL_PATH)/modules/lib/modules/2.6.32.9/modules.pcimap:/system/lib/modules/2.6.32.9/modules.pcimap
