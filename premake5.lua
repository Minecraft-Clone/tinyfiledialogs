-- tinyfiledialogs

project "tinyfiledialogs"
  kind "StaticLib"
  language "C"
  cdialect "c89"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  IncludeDir["tinyfiledialogs"] = "%{wks.location}/libs/tinyfiledialogs"

  includedirs {
    "%{IncludeDir.tinyfiledialogs}",
  }

  files {
    "premake5.lua",
    "tinyfiledialogs.h",
    "tinyfiledialogs.c",
    "more_dialogs/tinyfd_moredialogs.h",
    "more_dialogs/tinyfd_moredialogs.c"
  }

  --defines {
  --    "USE_OCL",
  --    "NOMINMAX"
  --}

  filter "system:linux"
    links {
      "comdlg32", "ole32"
    }

  filter "system:linux"
    pic "On"
  
  filter "system:macosx"
    pic "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    runtime "Release"
    optimize "On"