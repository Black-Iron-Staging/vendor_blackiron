# Set BlackIron specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common BlackIron stuff
$(call inherit-product, vendor/blackiron/config/common_full_phone.mk)
