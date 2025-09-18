#pragma once
#include <Geode/Geode.hpp>

using namespace geode::prelude;

#ifdef GEODE_IS_MACOS
    auto fullscreenListener() -> void;
#endif

$execute {
    #ifdef GEODE_IS_MACOS
        fullscreenListener();
    #endif
}