
ifeq ($(origin CC),default)
CC  = $(TOOLCHAIN_PREFIX)clang$(TOOLCHAIN_SUFFIX)
endif
ifeq ($(origin CXX),default)
CXX = $(TOOLCHAIN_PREFIX)clang++$(TOOLCHAIN_SUFFIX)
endif
ifeq ($(origin LD),default)
LD  = $(CXX)
endif
ifeq ($(origin AR),default)
AR  = $(TOOLCHAIN_PREFIX)ar$(TOOLCHAIN_SUFFIX)
endif

ifneq ($(STDCXX),)
CXXFLAGS_STDCXX = -std=$(STDCXX) -fexceptions -frtti -pthread
else ifeq ($(shell printf '\n' > bin/empty.cpp ; if $(CXX) -std=c++20 -c bin/empty.cpp -o bin/empty.out > /dev/null 2>&1 ; then echo 'c++20' ; fi ), c++20)
CXXFLAGS_STDCXX = -std=c++20 -fexceptions -frtti -pthread
else ifeq ($(shell printf '\n' > bin/empty.cpp ; if $(CXX) -std=c++17 -c bin/empty.cpp -o bin/empty.out > /dev/null 2>&1 ; then echo 'c++17' ; fi ), c++17)
CXXFLAGS_STDCXX = -std=c++17 -fexceptions -frtti -pthread
endif
CFLAGS_STDC = -std=c17 -pthread
CXXFLAGS += $(CXXFLAGS_STDCXX)
CFLAGS += $(CFLAGS_STDC)
LDFLAGS += -pthread

CPPFLAGS +=
CXXFLAGS += -fPIC
CFLAGS   += -fPIC
LDFLAGS  += 
LDLIBS   += -lm
ARFLAGS  := rcs

MODERN=1
NATIVE=1
OPTIMIZE=vectorize
OPTIMIZE_LTO=1

ifeq ($(NATIVE),1)
CXXFLAGS += -march=native
CFLAGS   += -march=native
endif

ifeq ($(OPTIMIZE_LTO),1)
CXXFLAGS += -flto
CFLAGS   += -flto
LDFLAGS  += -flto
endif

ifeq ($(CHECKED_ADDRESS),1)
CXXFLAGS += -fsanitize=address
CFLAGS   += -fsanitize=address
endif

ifeq ($(CHECKED_UNDEFINED),1)
CXXFLAGS += -fsanitize=undefined
CFLAGS   += -fsanitize=undefined
endif

include build/make/warnings-clang.mk

EXESUFFIX=
