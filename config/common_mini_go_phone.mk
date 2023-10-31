# Set BlackIron specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common BlackIron stuff
$(call inherit-product, vendor/blackiron/config/common_mini_phone.mk)
