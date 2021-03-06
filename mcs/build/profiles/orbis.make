#! -*- makefile -*-

BOOTSTRAP_PROFILE = build

BOOTSTRAP_MCS = MONO_PATH="$(topdir)/class/lib/$(BOOTSTRAP_PROFILE)$(PLATFORM_PATH_SEPARATOR)$$MONO_PATH" $(INTERNAL_CSC)
MCS = $(BOOTSTRAP_MCS)

# Use system resgen as we don't want local System.Windows.Forms dependency
RESGEN = resgen2

profile-check:
	@:

DEFAULT_REFERENCES = -r:$(topdir)/class/lib/$(PROFILE)/mscorlib.dll

PROFILE_MCS_FLAGS = \
	-d:NET_1_1 \
	-d:NET_2_0 \
	-d:NET_2_1 \
	-d:NET_3_5 \
	-d:NET_4_0 \
	-d:NET_4_5 \
	-d:MONO \
	-d:MOBILE,MOBILE_LEGACY \
	-d:FULL_AOT_DESKTOP	\
	-d:FULL_AOT_RUNTIME \
	-d:ORBIS \
	-d:DISABLE_REMOTING \
	-d:DISABLE_COM \
	-nowarn:1699 \
	-nostdlib \
	$(DEFAULT_REFERENCES) \
	$(PLATFORM_DEBUG_FLAGS)

FRAMEWORK_VERSION = 2.1

# the tuner takes care of the install
NO_INSTALL = yes
AOT_FRIENDLY_PROFILE = yes
ALWAYS_AOT = yes
MOBILE_PROFILE = yes
NO_VTS_TEST = yes
NO_CONSOLE = yes
PROFILE_DISABLE_BTLS = yes

# Note need for trailing comma. If you add, keep it
PROFILE_TEST_HARNESS_EXCLUDES = MobileNotWorking,PKITS,
