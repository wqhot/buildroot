################################################################################
#
# multivideoplayer
#
################################################################################

MULTIVIDEOPLAYER_VERSION = 1.0
MULTIVIDEOPLAYER_SITE = $(TOPDIR)/../app/jssrecovery
MULTIVIDEOPLAYER_SITE_METHOD = local

MULTIVIDEOPLAYER_LICENSE = ROCKCHIP
MULTIVIDEOPLAYER_LICENSE_FILES = LICENSE

# TODO: Add install rules in .pro
define MULTIVIDEOPLAYER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/applications $(TARGET_DIR)/usr/share/icons
	mkdir -p $(TARGET_DIR)/etc/jssrecovery/templates
	$(INSTALL) -D -m 0644 $(@D)/image/icon_jssrec.png $(TARGET_DIR)/usr/share/icons/
	$(INSTALL) -D -m 0755 $(@D)/jssRecoveryGUI/jssRecovery $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/jssServer/jssServer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/jssRecovery.desktop $(TARGET_DIR)/usr/share/applications/
	$(INSTALL) -D -m 0644 $(@D)/2k.parts $(TARGET_DIR)/etc/jssrecovery/templates/
	$(INSTALL) -D -m 0755 $(@D)/index.html $(TARGET_DIR)/var/www/index.html
endef

define MULTIVIDEOPLAYER_INSTALL_INIT_SYSV
$(INSTALL) -D -m 755 $(MULTIVIDEOPLAYER_PKGDIR)/S50jssRecovery \
	$(TARGET_DIR)/etc/init.d/S50jssRecovery
endef

define MULTIVIDEOPLAYER_INSTALL_INIT_SYSV
$(INSTALL) -D -m 755 $(MULTIVIDEOPLAYER_PKGDIR)/S41watchdog \
	$(TARGET_DIR)/etc/init.d/S41watchdog
endef

define MULTIVIDEOPLAYER_INSTALL_INIT_SYSV
$(INSTALL) -D -m 755 $(MULTIVIDEOPLAYER_PKGDIR)/S51jssServer \
	$(TARGET_DIR)/etc/init.d/S51jssServer
endef

$(eval $(qmake-package))
