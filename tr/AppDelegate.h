//
//  AppDelegate.h
//  tr
//
//  Created by Qays on 9/17/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;

@end


