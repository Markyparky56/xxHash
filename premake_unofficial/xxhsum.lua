include "xxhash-common.lua"

local XXHSUM_DIR = "../cli"

project "xxhsum"
    kind "ConsoleApp"
    language "C"
    cdialect "C17"
    vectorextensions "AVX2"
    exceptionhandling (EXCEPTIONS_ENABLED)
    rtti "Off"
    staticruntime (STATIC_RUNTIME)
    includedirs
    {
        "../",
        (XXHSUM_DIR)
    }
    files
    {
        path.join(XXHSUM_DIR, "**.c"),
        path.join(XXHSUM_DIR, "**.h")
    }
    links { "libxxhash" }
    filter "action:vs*"
        buildoptions { "/Zc:__cplusplus" }
        flags { "MultiProcessorCompile" }
    filter "files:**.c"
        compileas "C"
