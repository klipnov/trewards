//
//  rewardViewController.m
//  tr
//
//  Created by Aliff Ali Azizan on 9/18/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import "rewardViewController.h"

@interface rewardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (strong,nonatomic) NSTimer *pointTimer;
@property int currentPoints;
@end

@implementation rewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentPoints = 0;
    _pointsLabel.text = 0;
    _pointTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animatePoints) userInfo:nil repeats:YES];
    
}

- (void)animatePoints {
    
    if (_currentPoints < 300) {
        _currentPoints++;
    } else {
        [_pointTimer invalidate];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
