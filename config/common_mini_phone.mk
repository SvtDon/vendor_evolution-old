# Inherit common nexus evolution stuff
$(call inherit-product, vendor/evolution/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Include nexus evolution audio files
include vendor/evolution/config/cm_audio.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=Deneb.ogg \
    ro.config.alarm_alert=Hassium.ogg

PRODUCT_PACKAGES += \
  Mms

