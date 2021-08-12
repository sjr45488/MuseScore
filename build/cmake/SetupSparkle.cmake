include(GetPlatformInfo)
if (OS_IS_MAC)
    find_package(Sparkle) # needed for SPARKLE_FOUND and SPARKLE_LIBRARY variables
    if (SPARKLE_FOUND)
        set(SPARKLE_ENABLED 1)
        set(SPARKLE_APPCAST_URL "https://sparkle.musescore.org/${MSCORE_RELEASE_CHANNEL}/3/macos/appcast.xml")
    endif()
elseif (OS_IS_WIN)
    if (BUILD_64)
        set(ARCH_TYPE "_x64")
    else ()
        set(ARCH_TYPE "_x86")
    endif ()

    if ((NOT MSCORE_UNSTABLE) AND (NOT DEFINED WIN_PORTABLE)) # do not include WinSparkle in unstable and portable builds
        include(FindWinSparkle)
        add_library(winsparkledll SHARED IMPORTED)
        set_target_properties(winsparkledll PROPERTIES IMPORTED_IMPLIB ${WINSPARKLE_LIBRARY})
        set(SPARKLE_ENABLED 1)
        set(SPARKLE_APPCAST_URL "https://sparkle.musescore.org/${MSCORE_RELEASE_CHANNEL}/4/win/appcast${ARCH_TYPE}.xml")
        message("Win Sparkle Url: " ${WIN_SPARKLE_APPCAST_URL})
    endif()
else ()
    message("Sparkle is not supported on your system.")
endif ()