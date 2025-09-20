#pragma once
#include <Geode/Geode.hpp>

using namespace geode::prelude;

class Functions {
public:
    template <typename T>
    static auto bindFunctionToSetting(auto&& func, const std::string& settingName, bool immediate = true) -> void {
        if (immediate) func(Mod::get()->getSettingValue<T>(settingName));
        listenForSettingChanges(settingName, std::forward<decltype(func)>(func));
    }
};