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
@property (weak, nonatomic) IBOutlet UILabel *greenPoint;
@property (weak, nonatomic) IBOutlet UILabel *redPoint;
@property (weak, nonatomic) IBOutlet UILabel *rewardPoint;

@property (strong,nonatomic) NSTimer *pointTimer;
@property int currentPoints;
@property int currentRedPoint;
@property int currentGreenPoint;
@property int currentRewardPoint;

@end

@implementation rewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentPoints = 0;
    _pointsLabel.text = 0;
    
    _currentRedPoint = 0;
    _currentGreenPoint = 0;
    _currentRewardPoint = 0;
    
    _greenPoint.text = 0;
    _redPoint.text = 0;
    _rewardPoint.text = 0;
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _pointTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animatePoints) userInfo:nil repeats:YES];
}

- (void)animatePoints {
    
    if (_currentPoints < 300) {
        _currentPoints++;
        _pointsLabel.text = [NSString stringWithFormat:@"%d", _currentPoints];
    } else {
        [_pointTimer invalidate];
    }
    
    if (_currentRedPoint < 13) {
        _currentRedPoint++;
        _redPoint.text = [NSString stringWithFormat:@"%d", _currentRedPoint];
    }
    
    if (_currentGreenPoint <25) {
        _currentGreenPoint++;
        _greenPoint.text = [NSString stringWithFormat:@"%d", _currentGreenPoint];
    }
    
    if (_currentRewardPoint <3) {
        _currentRewardPoint++;
        _rewardPoint.text = [NSString stringWithFormat:@"%d", _currentRewardPoint];
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
