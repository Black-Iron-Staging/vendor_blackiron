# BlackIron packages
PRODUCT_PACKAGES += \
    BlackironSetupWizard \
    Prospect \
    GameSpace \
    NetworkStackOverlay \
    NoCombinedIconsOverlay \
    Panic \
    RepainterServicePriv \
    Ripple \
    TouchGestures \
    Updater \
    WarpShare

# Whether the compiled build to be shipped with Aperture CAM
TARGET_BUILD_APERTURE_CAMERA ?= true
ifeq ($(TARGET_BUILD_APERTURE_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Themes
PRODUCT_PACKAGES += \
    BlackironThemesStub \
    BlackironWalls \
    ThemePicker

# Udfps
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsResources
endif

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Extra tools in BlackIron
PRODUCT_PACKAGES += \
    bash \
    curl \
    getcap \
    htop \
    nano \
    setcap \
    vim

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/%/libfuse-lite.so \
    system/%/libntfs-3g.so

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync
