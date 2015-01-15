//
//  ODReveal.h
//  OnDotDot
//
//  Created by Yuk Lai Suen on 10/11/14.
//  Copyright (c) 2014 OnDotDot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODReveal : NSObject
+ (id)sharedInstance;
- (void)startReveal;
- (void)stopReveal;
@end
