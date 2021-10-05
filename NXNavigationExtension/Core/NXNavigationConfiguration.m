//
// NXNavigationConfiguration.m
//
// Copyright (c) 2020 Leo Lee NXNavigationExtension (https://github.com/l1Dan/NXNavigationExtension)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NXNavigationConfiguration.h"

// chevron.left@2x.png, SF Pro-Medium, compression, 默认颜色：tintColor = [UIColor whiteColor]
static NSString *NXNavigationBarAppearanceNackImageBase64 = @"iVBORw0KGgoAAAANSUhEUgAAABQAAAAjCAMAAACjKNoqAAAAgVBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9d3yJTAAAAK3RSTlMA2QUR1K2xGAzHwaWblI+Ld2hQJ83Mu7e1n5iJfXJsY11IQC0dCINYOSIHKsEspwAAAKhJREFUKM990ckSgjAURNEEJKDMCDIo4Dz9/wcqnU06przLs3ld9YTds6h+bJZSlpaV8ptim+RSTjbCWt+0AtaRHWDKYQHZXVtk2h4Wk+XabgZ5GawnS2GJZ9oAG8gSWGrau4dlMN6SC6rGDcGpBVdnxkvt1AZ6Yt2u/2jlUmnpawN9sF61Hp06s4Y7aOnUydIWOrL6HbSwVNkboAGeL7ho0VTYmjVx+AEgOgfYXg2whAAAAABJRU5ErkJggg==";


@implementation NXNavigationBarAppearance

- (instancetype)init {
    if (self = [super init]) {
        _tintColor = [UIColor systemBlueColor];
        if (@available(iOS 13.0, *)) {
            _backgroundColor = [UIColor systemBackgroundColor];
        } else {
            _backgroundColor = [UIColor whiteColor];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    NXNavigationBarAppearance *newAppearance = [[NXNavigationBarAppearance alloc] init];
    newAppearance.tintColor = self.tintColor;
    newAppearance.barTintColor = self.barTintColor;
    
    newAppearance.shadowImage = self.shadowImage;
    newAppearance.shadowColor = self.shadowColor;
    
    newAppearance.titleTextAttributes = self.titleTextAttributes;
    if (@available(iOS 11.0, *)) {
        newAppearance.largeTitleTextAttributes = self.largeTitleTextAttributes;
    }
    
    newAppearance.backgroundColor = self.backgroundColor;
    newAppearance.backgroundImage = self.backgroundImage;
    
    newAppearance.backButtonCustomView = self.backButtonCustomView;
    newAppearance.backImage = self.backImage;
    newAppearance.landscapeBackImage = self.landscapeBackImage;

    return newAppearance;
}

#pragma mark - Getter

- (UIImage *)backImage {
    if (!_backImage) {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:NXNavigationBarAppearanceNackImageBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        if (data) {
            return [UIImage imageWithData:data scale:2.0];
        }
        return nil;
    }
    return _backImage;
}

- (UIImage *)landscapeBackImage {
    if (!_landscapeBackImage) {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:NXNavigationBarAppearanceNackImageBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        if (data) {
            return [UIImage imageWithData:data scale:3.0];
        }
        return nil;
    }
    return _landscapeBackImage;
}

- (NSDictionary<NSAttributedStringKey,id> *)largeTitleTextAttributes {
    if (!_largeTitleTextAttributes) {
        _largeTitleTextAttributes = self.titleTextAttributes;
    }
    return _largeTitleTextAttributes;
}

@end


@implementation NXNavigationControllerPreferences

- (instancetype)init {
    if (self = [super init]) {
        _fullscreenInteractivePopGestureEnabled = NO;
        _menuSupplementBackButton = NO;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    NXNavigationControllerPreferences *newPreferences = [[NXNavigationControllerPreferences alloc] init];
    newPreferences.backImageInsets = self.backImageInsets;
    newPreferences.landscapeBackImageInsets = self.landscapeBackImageInsets;
    newPreferences.fullscreenInteractivePopGestureEnabled = self.fullscreenInteractivePopGestureEnabled;
    if (@available(iOS 14.0, *)) {
        newPreferences.menuSupplementBackButton = self.menuSupplementBackButton;
    }
    return newPreferences;
}

- (void)setMenuSupplementBackButton:(BOOL)menuSupplementBackButton {
    _menuSupplementBackButton = menuSupplementBackButton;
    if (menuSupplementBackButton) {
        _backImageInsets = UIEdgeInsetsMake(0, -8, 0, 0);
        _landscapeBackImageInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    } else {
        _backImageInsets = UIEdgeInsetsZero;
        _landscapeBackImageInsets = UIEdgeInsetsZero;
    }
}

@end


@implementation NXViewControllerPreferences

- (instancetype)init {
    if (self = [super init]) {
        _useBlurNavigationBar = NO;
        _disableInteractivePopGesture = NO;
        _enableFullscreenInteractivePopGesture = NO;
        _automaticallyHideNavigationBarInChildViewController = YES;
        _translucentNavigationBar = NO;
        _contentViewWithoutNavigtionBar = NO;
        _backButtonMenuEnabled = NO;
        _interactivePopMaxAllowedDistanceToLeftEdge = 0.0;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    NXViewControllerPreferences *newPreferences = [[NXViewControllerPreferences alloc] init];
    newPreferences.useBlurNavigationBar = self.useBlurNavigationBar;
    newPreferences.disableInteractivePopGesture = self.disableInteractivePopGesture;
    newPreferences.enableFullscreenInteractivePopGesture = self.enableFullscreenInteractivePopGesture;
    newPreferences.automaticallyHideNavigationBarInChildViewController = self.automaticallyHideNavigationBarInChildViewController;
    newPreferences.translucentNavigationBar = self.translucentNavigationBar;
    newPreferences.contentViewWithoutNavigtionBar = self.contentViewWithoutNavigtionBar;
    newPreferences.interactivePopMaxAllowedDistanceToLeftEdge = self.interactivePopMaxAllowedDistanceToLeftEdge;
    if (@available(iOS 14.0, *)) {
        newPreferences.backButtonMenuEnabled = self.backButtonMenuEnabled;
    }
    return newPreferences;
}

@end


@implementation NXNavigationConfiguration

- (NXNavigationBarAppearance *)navigationBarAppearance {
    if (!_navigationBarAppearance) {
        _navigationBarAppearance = [[NXNavigationBarAppearance alloc] init];
    }
    return _navigationBarAppearance;
}

- (NXNavigationControllerPreferences *)navigationControllerPreferences {
    if (!_navigationControllerPreferences) {
        _navigationControllerPreferences = [[NXNavigationControllerPreferences alloc] init];
    }
    return _navigationControllerPreferences;
}

- (NXViewControllerPreferences *)viewControllerPreferences {
    if (!_viewControllerPreferences) {
        _viewControllerPreferences = [[NXViewControllerPreferences alloc] init];
    }
    return _viewControllerPreferences;
}

- (id)copyWithZone:(NSZone *)zone {
    NXNavigationConfiguration *newConfiguration = [[NXNavigationConfiguration alloc] init];
    newConfiguration.navigationBarAppearance = [self.navigationBarAppearance copy];
    newConfiguration.navigationControllerPreferences = [self.navigationControllerPreferences copy];
    newConfiguration.viewControllerPreferences = [self.viewControllerPreferences copy];
    return newConfiguration;
}

@end
