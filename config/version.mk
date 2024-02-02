# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2022 BlackIron
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
ifeq ($(BLACKIRON_VERSION_APPEND_TIME_OF_DAY),true)
    BUILD_DATE := $(shell date -u +%Y%m%d-%H%M%S)
else
    BUILD_DATE := $(shell date -u +%Y%m%d)
endif

TARGET_PRODUCT_SHORT := $(subst blackiron_,,$(BLACKIRON_BUILDTYPE))

BLACKIRON_BUILDTYPE ?= UNOFFICIAL
BLACKIRON_DATE_YEAR := $(shell date -u +%Y)
BLACKIRON_DATE_MONTH := $(shell date -u +%m)
BLACKIRON_DATE_DAY := $(shell date -u +%d)
BLACKIRON_DATE_HOUR := $(shell date -u +%H)
BLACKIRON_DATE_MINUTE := $(shell date -u +%M)
BLACKIRON_BUILD_DATE := $(BLACKIRON_DATE_YEAR)$(BLACKIRON_DATE_MONTH)$(BLACKIRON_DATE_DAY)-$(BLACKIRON_DATE_HOUR)$(BLACKIRON_DATE_MINUTE)

BLACKIRON_STATUS := 4.1
BLACKIRON_BUILD_VERSION := $(PLATFORM_VERSION)
BLACKIRON_VERSION := $(BLACKIRON_STATUS)_$(BLACKIRON_BUILD)-$(BLACKIRON_BUILD_VERSION)-$(BLACKIRON_BUILD_DATE)-$(BLACKIRON_BUILDTYPE)

ROM_FINGERPRINT := BlackIron/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

ifeq ($(BLACKIRON_BUILDTYPE), CI)
    BUILD_KEYS := release-keys
endif

PRODUCT_SYSTEM_PROPERTIES += \
  ro.blackiron.build.version=$(BLACKIRON_BUILD_VERSION) \
  ro.blackiron.build.date=$(BUILD_DATE) \
  ro.blackiron.buildtype=$(BLACKIRON_BUILDTYPE) \
  ro.blackiron.fingerprint=$(ROM_FINGERPRINT) \
  ro.blackiron.version=$(BLACKIRON_VERSION) \
  ro.modversion=$(BLACKIRON_VERSION)

ifneq ($(OVERRIDE_OTA_CHANNEL),)
PRODUCT_SYSTEM_PROPERTIES += \
    blackiron.updater.uri=$(OVERRIDE_OTA_CHANNEL)
endif
