project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir   ("%{wks.location}/obj/" .. outputdir .. "/%{prj.name}")

    files {
        "include/GLFW/**.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",
        "src/null_joystick.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_init.c",
    }

    includedirs { "include" }

    flags { "MultiProcessorCompile" }

    filter "system:windows"
        systemversion "latest"
        buildoptions { "/utf-8" }
        defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }

        files {
            "src/win32_module.c",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
        }

    filter "system:linux"
        pic "On"
        systemversion "latest"
        defines { "_GLFW_X11" }

        files {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/linux_joystick.c",
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release or configurations:Dist" }
        runtime "Release"
        optimize "on"
