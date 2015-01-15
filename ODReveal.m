//
//  ODReveal.m
//  OnDotDot
//
//  Created by Yuk Lai Suen on 10/11/14.
//  Copyright (c) 2014 OnDotDot. All rights reserved.
//

#import "ODLog.h"
#import "ODReveal.h"
#import <dlfcn.h>

@interface ODReveal()
{
    void *_revealLib;
}
@end

@implementation ODReveal

+ (id) sharedInstance
{
    static dispatch_once_t onceToken;
    static ODReveal *revealApp;
    dispatch_once(&onceToken, ^{
        revealApp = [[ODReveal alloc] init];
    });
    return revealApp;
}

- (void)startReveal
{
#if TARGET_IPHONE_SIMULATOR
    NSString *revealLibName = @"libReveal";
    NSString *revealLibExtension = @"dylib";
    NSString *dyLibPath = [[NSBundle mainBundle] pathForResource:revealLibName ofType:revealLibExtension];
    ODLog(@"Loading dynamic library: %@", dyLibPath);
    
    _revealLib = dlopen([dyLibPath cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
    
    if (_revealLib == NULL)
    {
        char *error = dlerror();
        ODLog(@"dlopen error: %s", error);
    }
    else
    {
        // Post a notification to signal Reveal to start the service.
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:self];
    }
#endif
}

- (void)stopReveal
{
#if TARGET_IPHONE_SIMULATOR
    if (_revealLib)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStop" object:self];
        if (dlclose(_revealLib) == 0)
        {
            ODLog(@"Reveal library unloaded");
            _revealLib = NULL;
        }
        else
        {
            char *error = dlerror();
            ODLog(@"Reveal library could not be unloaded: %s", error);
        }
    }
#endif
}

@end
