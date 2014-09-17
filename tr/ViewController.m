//
//  ViewController.m
//  tr
//
//  Created by Qays on 9/17/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//
//Hackhaton AT&T

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBLoginView *loginView  = [[FBLoginView alloc] init];
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), self.view.center.y);
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
