$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/i8200/i8200-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/i8200/overlay

LOCAL_PATH := device/samsung/i8200
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_i8200
PRODUCT_DEVICE := i8200

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.bq.gpu_to_cpu_unsupported=1 \
    wifi.interface=wlan0 \
    wifi.softap.interface=wlan0 \
    wifi.supplicant_scan_interval=30 \
    dalvik.vm.heapsize=128m

DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb \
    sys.disable_ext_animation=1

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Graphics config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gfx.cfg:system/etc/gfx.cfg \
    $(LOCAL_PATH)/configs/dms.cfg:system/etc/dms.cfg

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc

# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni
