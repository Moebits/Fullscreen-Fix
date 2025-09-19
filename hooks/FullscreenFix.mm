#import <Cocoa/Cocoa.h>
#include "FullscreenFix.hpp"

auto notchHeight() -> CGFloat {
    NSWindow* window = [NSApp mainWindow];
    if (!window) return 0;

    NSScreen* screen = [window screen];
    if (!screen) return 0;

    if (@available(macOS 12.0, *)) {
        return screen.safeAreaInsets.top;
    }
    return 0;
}

auto shiftWindow() -> void {
    NSWindow* window = [NSApp mainWindow];
    if (!window) return;

    NSView* content = [window contentView];
    if (!content) return;

    NSRect rect = [content frame];
    bool fullscreen = window.styleMask & NSWindowStyleMaskFullScreen;
    CGFloat offset = fullscreen ? notchHeight() + Mod::get()->getSettingValue<int64_t>("shift-offset") : 0;

    if (fullscreen && Mod::get()->getSettingValue<bool>("borderless")) {
        offset = 0;
        [window setStyleMask:NSWindowStyleMaskBorderless];
        [window setLevel:NSMainMenuWindowLevel + 1];
        [window setFrame:[[NSScreen mainScreen] frame] display:YES animate:NO];
    }

    rect.origin.y = -offset;
    rect.size.height = content.bounds.size.height + offset;

    [content setFrame:rect];
}

auto fullscreenListener() -> void {
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];

    [center addObserverForName:NSWindowDidEnterFullScreenNotification
     object:nil queue:nil usingBlock:^(NSNotification* notif) {
        shiftWindow();
    }];

    [center addObserverForName:NSWindowDidExitFullScreenNotification
     object:nil queue:nil usingBlock:^(NSNotification* notif) {
        shiftWindow();
    }];
}