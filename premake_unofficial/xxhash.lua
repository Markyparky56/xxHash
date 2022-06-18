project "libxxhash"
    kind "StaticLib"
    language "C"
    vectorextensions "AVX2"
    includedirs
    {
        "../"
    }
    files
    {
        "../xxhash.c",
        "../xxhash.h"
    }
    filter "platforms:x86"
        files
        {
            "../xxh_x86dispatch.c",
            "../xxh_x86dispatch.h"
        }
    filter "action:vs*"
        buildoptions { "/Zc:__cplusplus" }
        flags { "MultiProcessorCompile" }
    filter "files:**.c"
        compileas "C"
