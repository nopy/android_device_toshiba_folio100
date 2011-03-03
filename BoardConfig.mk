USE_CAMERA_STUB := true
BOARD_USE_FROYO_LIBCAMERA := true

# inherit from the proprietary version
-include vendor/nvidia/betelgeuse/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
TARGET_HAVE_TEGRA_ERRATA_657451 := true
TARGET_USES_OLD_LIBSENSORS_HAL := true

# custom recovery ui
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/nvidia/betelgeuse/recovery/recovery_ui.c

TARGET_NO_BOOTLOADER := true
#TARGET_NO_RECOVERY := true
TARGET_BOOTLOADER_BOARD_NAME := betelgeuse

# use pre-kernel.35 vold usb mounting
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# Modem
TARGET_NO_RADIOIMAGE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
#WIFI_DRIVER_MODULE_PATH     := "/system/wifi/ar6000.ko"
WIFI_DRIVER_MODULE_PATH     := "/system/wifi/usbtest.ko"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/hw/wlan/ar6000.ko"
#WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/lib/hw/wlan/fw_bcm4329.bin nvram_path=/system/lib/hw/wlan/nvram.txt"
#WIFI_DRIVER_MODULE_ARG      := "ifname=wlan0"
#WIFI_DRIVER_MODULE_ARG      := ""
#WIFI_DRIVER_MODULE_NAME     := "ar6000"
WIFI_DRIVER_MODULE_NAME     := "usbtest"

BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_CSR := true

#BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1 cpuid=200102 devicetype=1002 btmac=9c5ed6131a00 tegraboot=nand mtdparts=tegra_nand:16384K@12032K(misc),16384K@62208K(recovery),16384K@79104K(boot),204800K@96000K(system),222464K@301312K(cache),4096K@7424K(bootbmp),32768K@28928K(logodata) androidboot.hardware=betelgeuse
BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=tty0,115200n8 usbcore.old_scheme_first=1 tegraboot=sdmmc tegrapart=recovery:122000:a00:800,linux:a0e00:1000:800,loader:300:400:800,mbr:700:200:800,system:900:20000:800,cache:20900:80000:800,misc:a0900:400:800,userdata:a1f00:80000:800 boardtype=PR androidboot.hardware=betelgeuse androidboot.console=tty0 init=/init
#BOARD_KERNEL_CMDLINE := mem=448M@0M nvmem=64M@448M vmalloc=192M video=tegrafb console=ttyUSB0,115200n8 usbcore.old_scheme_first=1 tegraboot=sdmmc tegrapart=recovery:122000:a00:800,linux:a0e00:1000:800,loader:300:400:800,mbr:700:200:800,system:900:20000:800,cache:20900:80000:800,misc:a0900:400:800,userdata:a1f00:80000:800 boardtype=PR
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := true

# Use dirty hack to allow froyo libaudio
BOARD_USE_KINETO_COMPATIBILITY := true

BOARD_EGL_CFG := device/nvidia/betelgeuse/egl.cfg

# fix this up by examining /proc/mtd on a running device
# dev:    size   erasesize  name
# mtd0: 01000000 00020000 "misc"
# mtd1: 01000000 00020000 "recovery"
# mtd2: 01000000 00020000 "boot"
# mtd3: 0c800000 00020000 "system"
# mtd4: 0d940000 00020000 "cache"
# mtd5: 00400000 00020000 "bootbmp"
# mtd6: 02000000 00020000 "logodata"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072

# Setting this to avoid boot locks on the system from using the "misc" partition.
BOARD_HAS_NO_MISC_PARTITION := true

# Indicate that the board has an Internal SD Card
BOARD_HAS_SDCARD_INTERNAL := true

#TARGET_PREBUILT_KERNEL := device/nvidia/betelgeuse/kernel

## Below is a sample of how you can tweak the mount points using the board config.
## This is for the Samsung Galaxy S.
## Feel free to tweak or remove this code.
## If you want to add/tweak a mount point, the BOARD_X_FILESYSTEM_OPTIONS are optional.
BOARD_DATA_DEVICE := /dev/block/mmcblk0p6
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p2
BOARD_CACHE_FILESYSTEM := ext4
#BOARD_MISC_DEVICE := /dev/block/mmcblk0p3
#BOARD_MISC_FILESYSTEM := ext4
#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1
#BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
#BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p8
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
##BOARD_HAS_DATADATA := true
##BOARD_DATADATA_DEVICE := /dev/block/stl10
##BOARD_DATADATA_FILESYSTEM := auto
##BOARD_DATADATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
#BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p1
#BOARD_SYSTEM_FILESYSTEM := ext4
##BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no

BOARD_VOLD_MAX_PARTITIONS := 8
