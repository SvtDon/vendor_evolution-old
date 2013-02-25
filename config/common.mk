PRODUCT_BRAND ?= evolution

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    windowsmgr.max_events_per_sec=280 \
    ro.media.enc.jpeg.quality=100 \
    ro.com.android.dataroaming=false
    
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1    

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/evolution/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Prebuilt Apps
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/app/Nova.apk:system/app/Nova.apk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/evolution/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/evolution/prebuilt/common/bin/50-evolution.sh:system/addon.d/50-evolution.sh \
    vendor/evolution/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks

# evolution-specific init file
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/etc/init.evolution.rc:root/init.evolution.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/evolution/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/evolution/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/evolution/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is nexus evolution!
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/com.evolution.android.xml:system/etc/permissions/com.evolution.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/evolution/config/themes_common.mk

# Required nexus evolution packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    Superuser \
    su

# Optional nexus evolution packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom nexus evolution packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    EvolutionFileManager \
    LockClock

# Extra tools in nexus evolution
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof

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

PRODUCT_PACKAGE_OVERLAYS += vendor/evolution/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/evolution/overlay/common

PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 1

ifdef EVOLUTION_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.evolution.version=Evolution-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-NIGHTLY-$(shell date +%m%d%Y) \
        ro.modversion=Evolution-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-NIGHTLY-$(shell date +%m%d%Y)
else
ifdef EVOLUTION_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.evolution.version=Evolution-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-OFFICIAL \
            ro.modversion=Evolution-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-OFFICIAL
else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.evolution.version=Evolution-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(shell date +"%Y%m%d-%H%M")-UNOFFICIAL \
            ro.modversion=Evolution-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PRODUCT_RELEASE_NAME)-$(shell date +"%Y%m%d-%H%M")-UNOFFICIAL
endif
endif
