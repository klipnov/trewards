//
//  initGameViewController.m
//  tr
//
//  Created by Aliff Ali Azizan on 9/18/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import "initGameViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface initGameViewController ()

@property (strong,nonatomic) CMMotionManager *motionManager;
@property double accelX;
@property double accelY;
@property double accelZ;

@end

@implementation initGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = 0.2;
    
    NSLog(@"inside initGame");
    
    /*[_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        _accelX = accelerometerData.acceleration.x;
        _accelY = accelerometerData.acceleration.y;
        _accelZ = accelerometerData.acceleration.z;
        
        NSLog(@"X: %f",_accelX);
        NSLog(@"Y: %f",_accelY);
        NSLog(@"Z: %f",_accelZ);
        
        
        
        if (error) {
            NSLog(@"%@",error);
        }
        
    }];*/
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(startGame) userInfo:nil repeats:NO];
}

- (void)startGame {
    [self performSegueWithIdentifier:@"gameStarted" sender:self];
}

- (void)motionDetection {
    
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
