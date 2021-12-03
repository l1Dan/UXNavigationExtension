//
// NXNavigationExtension+Deprecated.h
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

#import <UIKit/UIKit.h>

#if __has_include(<NXNavigationExtension/NXNavigationExtension.h>)

#import <NXNavigationExtension/NXNavigationConfiguration.h>

#else

#import "NXNavigationConfiguration.h"

#endif /* __has_include */

NS_ASSUME_NONNULL_BEGIN

@interface NXViewControllerPreferences (NXNavigationExtensionDeprecated)

@property (nonatomic, assign) BOOL contentViewWithoutNavigationBar API_DEPRECATED("Use systemNavigationBarUserInteractionDisabled instead.", ios(2.0, 2.0));

@end


@interface UIViewController (NXNavigationExtensionDeprecated)

@property (nonatomic, assign, readonly) BOOL nx_contentViewWithoutNavigationBar API_DEPRECATED("Use nx_systemNavigationBarUserInteractionDisabled instead.", ios(2.0, 2.0));

@end

NS_ASSUME_NONNULL_END
