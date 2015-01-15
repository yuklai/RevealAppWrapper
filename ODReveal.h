//
//  ODReveal.h
//  OnDotDot
//
//  Created by Yuk Lai Suen on 10/11/14.
//  Copyright (c) 2014 OnDotDot. All rights reserved.
//
//  Instructions:
//  1. Visit www.revealapp.com and download the latest build.
//  2. Open revealapp > Help > Show Reveal Library in Finder
//  3. Copy the dynamic library libReveal.dylib to your project's directory.
//  4. Add libReveal.dylib to your project. Navigator > Add Files to "Your Project"
//  5. Add following line to your application:didFinishLaunchingWithOptions:
//         [[ODReveal sharedInstance] startReveal];
//  6. Add following line to your applicationWillTerminate:
//         [[ODReveal sharedInstance] stopReveal];
//  Reveal would only be loaded in simulator after these steps.

#import <Foundation/Foundation.h>

@interface ODReveal : NSObject
+ (id)sharedInstance;
- (void)startReveal;
- (void)stopReveal;
@end
