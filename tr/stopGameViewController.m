//
//  stopGameViewController.m
//  tr
//
//  Created by Aliff Ali Azizan on 9/18/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import "stopGameViewController.h"

@interface stopGameViewController ()

@end

@implementation stopGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"ready to give reward");
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(gotoReward) userInfo:nil repeats:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoReward {
    [self performSegueWithIdentifier:@"gotoRewards" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
