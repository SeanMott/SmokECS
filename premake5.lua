include "C:\\GameDev\\BTDSTD"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SmokECS"
kind "StaticLib"
language "C++"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

files 
{
    "includes/**.h",
    "src/**.c",
    "includes/**.hpp",
    "src/**.cpp",
}

includedirs
{
    "includes",
    
    "C:\\GameDev\\Libraries\\yaml-cpp\\include",
    "C:\\GameDev\\Libraries\\glm",
    "C:\\GameDev\\Libraries\\glfw\\include",

    "C:\\GameDev\\BTDSTD/includes",
    "C:\\GameDev\\BTDSTD_C/includes"
}

links
{
    "BTDSTD",
}
                
defines
{
    "GLM_FORCE_RADIANS",
    "GLM_FORCE_DEPTH_ZERO_TO_ONE",
    "GLM_ENABLE_EXPERIMENTAL"
}
                
flags
{
    "NoRuntimeChecks",
    "MultiProcessorCompile"
}

--platforms
filter "system:windows"
cppdialect "C++17"
staticruntime "On"
systemversion "latest"

defines
{
    "Window_Build",
    "Desktop_Build"
}

--configs
filter "configurations:Debug"
defines "DEBUG"
symbols "On"

links
{
   --"BTDSTD"
    -- "C:\\GameDev\\Libraries\\glfw\\bin\\Debug-windows-x86_64\\GLFW\\GLFW.lib"
}

filter "configurations:Release"
defines "RELEASE"
optimize "On"

flags
{
    -- "LinkTimeOptimization"
}

links
{
   -- "C:\\GameDev\\Libraries\\glfw\\bin\\Release-windows-x86_64\\GLFW\\GLFW.lib"
}

filter "configurations:Dist"
defines "DIST"
optimize "On"

defines
{
    "NDEBUG"
}

flags
{
    -- "LinkTimeOptimization"
}

links
{
    --"C:\\GameDev\\Libraries\\glfw\\bin\\Dist-windows-x86_64\\GLFW\\GLFW.lib"
}