# Inherit full common BlackIron stuff
$(call inherit-product, vendor/blackiron/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include BlackIron LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/blackiron/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/blackiron/config/telephony.mk)

# Inherit from GMS product config
ifeq ($(TARGET_USES_MINI_GAPPS),true)
$(call inherit-product, vendor/gms/gms_mini.mk)
else ifeq ($(TARGET_USES_PICO_GAPPS),true)
$(call inherit-product, vendor/gms/gms_pico.mk)
else
$(call inherit-product, vendor/gms/gms_full.mk)
endif
