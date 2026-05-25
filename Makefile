include $(TOPDIR)/rules.mk

PKG_NAME:=podman-init
PKG_VERSION:=1.0.0
PKG_RELEASE:=3

PKG_LICENSE:=Apache-2.0
PKG_MAINTAINER:=Julian Rossbach <contact@juffma.de>

include $(INCLUDE_DIR)/package.mk

define Package/podman-init
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=https://github.com/Juff-Ma/openwrt-podman-init
  TITLE:=Podman init Integration
  DEPENDS:=+podman
endef

define Package/podman-init/description
  Podman init Integration: Helper to start Podman containers using the OpenWRT init system
endef

define Package/podman-init/conffiles
/etc/config/podman
endef

define Build/Configure
  true
endef

define Build/Prepare
  true
endef

define Build/Compile
  true
endef

define Package/podman-init/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/podman.conf $(1)/etc/config/podman

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/containers.init $(1)/etc/init.d/containers
endef

$(eval $(call BuildPackage,podman-init))
