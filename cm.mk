## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := i8200

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i8200/device_i8200.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := i8200
PRODUCT_NAME := cm_i8200
PRODUCT_BRAND := samsung
PRODUCT_MODEL := i8200
PRODUCT_MANUFACTURER := samsung
