 
 project "libopenmpt"
  uuid "9C5101EF-3E20-4558-809B-277FDD50E878"
  language "C++"
  location ( "../../build/" .. mpt_projectpathname )
  vpaths { ["*"] = "../../" }
  mpt_projectname = "libopenmpt"
  dofile "../../build/premake-xcode/premake-defaults-LIBorDLL.lua"
  dofile "../../build/premake-xcode/premake-defaults.lua"
  local extincludedirs = {
   "../../include/mpg123/ports/Xcode",
   "../../include/mpg123/src/libmpg123",
   "../../include/ogg/include",
   "../../include/vorbis/include",
--   "../../include/zlib",
  }
  externalincludedirs ( extincludedirs )
  includedirs {
   "../..",
   "../../src",
   "../../common",
   "../../soundlib",
   "$(IntDir)/svn_version",
  }
  files {
   "../../src/mpt/**.cpp",
   "../../src/mpt/**.hpp",
   "../../common/*.cpp",
   "../../common/*.h",
   "../../soundbase/*.cpp",
   "../../soundbase/*.h",
   "../../soundlib/*.cpp",
   "../../soundlib/*.h",
   "../../soundlib/plugins/*.cpp",
   "../../soundlib/plugins/*.h",
   "../../soundlib/plugins/dmo/*.cpp",
   "../../soundlib/plugins/dmo/*.h",
   "../../sounddsp/*.cpp",
   "../../sounddsp/*.h",
   "../../libopenmpt/*.cpp",
   "../../libopenmpt/*.hpp",
   "../../libopenmpt/*.h",
  }
	excludes {
		"../../src/mpt/crypto/**.cpp",
		"../../src/mpt/crypto/**.hpp",
		"../../src/mpt/fs/**.cpp",
		"../../src/mpt/fs/**.hpp",
		"../../src/mpt/json/**.cpp",
		"../../src/mpt/json/**.hpp",
		"../../src/mpt/library/**.cpp",
		"../../src/mpt/library/**.hpp",
		"../../src/mpt/test/**.cpp",
		"../../src/mpt/test/**.hpp",
		"../../src/mpt/uuid_namespace/**.cpp",
		"../../src/mpt/uuid_namespace/**.hpp",
		"../../src/openmpt/sounddevice/**.cpp",
		"../../src/openmpt/sounddevice/**.hpp",
	}

  defines { "LIBOPENMPT_BUILD" }
	defines {
		"MPT_WITH_MPG123",
		"MPT_WITH_OGG",
		"MPT_WITH_VORBIS",
		"MPT_WITH_VORBISFILE",
		"MPT_WITH_ZLIB",
	}
  links {
   "mpg123",
   "vorbis",
   "ogg",
--   "zlib",
   "z",
  }
