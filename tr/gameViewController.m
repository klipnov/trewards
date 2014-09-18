//
//  gameViewController.m
//  tr
//
//  Created by Aliff Ali Azizan on 9/18/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import "gameViewController.h"

@interface gameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cloudsImg;
@property (weak, nonatomic) IBOutlet UIImageView *groundImg;
@property (weak, nonatomic) IBOutlet UIImageView *groundImg2;
@property (weak, nonatomic) IBOutlet UIImageView *trainImg;

@property (strong,nonatomic) NSTimer *buttonTimer;
@property (strong,nonatomic) UIButton *touchable;
@property (strong,nonatomic) UIButton *touchable2;
@property (strong,nonatomic) UIButton *touchable3;
@property (strong,nonatomic) UIButton *touchable4;
@property (strong,nonatomic) UIButton *touchable5;
@property (strong,nonatomic) UIButton *touchable6;
@property (strong,nonatomic) UIButton *touchable7;
@property (strong,nonatomic) UIButton *touchable8;

@property (strong,nonatomic) UIButton *touchable9;
@property (strong,nonatomic) UIButton *touchable10;
@property (strong,nonatomic) UIButton *touchable11;
@property (strong,nonatomic) UIButton *touchable12;
@property (strong,nonatomic) UIButton *touchable13;
@property (strong,nonatomic) UIButton *touchable14;

@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UILabel *greenPoint;
@property (weak, nonatomic) IBOutlet UILabel *redPoints;
@property (weak, nonatomic) IBOutlet UILabel *rewardPoints;

@property int currentPoints;
@property int currentGreenPoint;
@property int currentRedPoints;
@property int currentRewardPoint;

@end

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    
    [UIView animateWithDuration:20.0 animations:^{
        _cloudsImg.transform = CGAffineTransformMakeTranslation(-300, 0);
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"stopGame" sender:self];
    }];
    
    [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        _trainImg.transform = CGAffineTransformMakeTranslation(0, 3);
    } completion:^(BOOL finished) {
        
    }];
    
    [self animateGround];
    
    [self initTouchables];
    
    _currentGreenPoint = 0;
    _currentPoints = 0;
    _currentRedPoints = 0;
    _currentRewardPoint = 0;
    
    _points.text = @"0";
    _greenPoint.text = @"0";
    _redPoints.text = @"0";
    _rewardPoints.text = @"0";
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(addPointsToGame) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(addPointsToGreen) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addPointsToRed) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(addPointsToReward) userInfo:nil repeats:YES];
    
}

- (void)addPointsToGame {
    
    if (_currentPoints < 300) {
        _currentPoints++;
        _points.text = [NSString stringWithFormat:@"%d",_currentPoints];
    }
    
    /*if (_currentGreenPoint < 9) {
        _currentGreenPoint++;
        _greenPoint.text = [NSString stringWithFormat:@"%d", _currentGreenPoint];
        
    }
    
    if (_currentRedPoints < 12) {
        _currentRedPoints++;
        _redPoints.text = [NSString stringWithFormat:@"%d", _currentRedPoints];
        
    }*/
    
}

- (void)addPointsToRed {
    if (_currentRedPoints < 12) {
        _currentRedPoints++;
        _redPoints.text = [NSString stringWithFormat:@"%d", _currentRedPoints];
        
    }
}

- (void)addPointsToGreen {
    if (_currentGreenPoint < 9) {
        _currentGreenPoint++;
        _greenPoint.text = [NSString stringWithFormat:@"%d", _currentGreenPoint];
        
    }
}

- (void)addPointsToReward {
    if (_currentRewardPoint < 10) {
        _currentRewardPoint++;
        _rewardPoints.text = [NSString stringWithFormat:@"%d", _currentRewardPoint];
        
    }
}



- (void)animateGround {
   /* [UIView animateWithDuration:3.0 animations:^{
        _groundImg.transform = CGAffineTransformMakeTranslation(-400, 0);
        _groundImg2.transform = CGAffineTransformMakeTranslation(-400, 0);
    } completion:^(BOOL finished) {
        //_groundImg.frame = CGRectMake(0, 233, 568, 97);
        
    }];*/
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear animations:^{
        _groundImg.transform = CGAffineTransformMakeTranslation(-568, 0);
        _groundImg2.transform = CGAffineTransformMakeTranslation(-568, 0);
    } completion:nil];
    
    
}

- (void)resetGround {
    _groundImg.frame = CGRectMake(0, 400, 568, 97);
    _groundImg2.frame = CGRectMake(568, 400, 568, 97);
}

- (void)initTouchables {
    
    _touchable = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable setFrame:CGRectMake(800, 30, 29, 27)];
    [_touchable setImage:[UIImage imageNamed:@"04_greenPoint@2x.png"] forState:UIControlStateNormal];
    [_touchable addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable];
    
    _touchable2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable2 setFrame:CGRectMake(1000, 90, 29, 27)];
    [_touchable2 setImage:[UIImage imageNamed:@"02_iconRewards@2x.png"] forState:UIControlStateNormal];
    [_touchable2 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable2];
    
    _touchable3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable3 setFrame:CGRectMake(1800, 80, 29, 27)];
    [_touchable3 setImage:[UIImage imageNamed:@"04_greenPoint@2x.png"] forState:UIControlStateNormal];
    [_touchable3 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable3];
    
    _touchable4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable4 setFrame:CGRectMake(1200, 30, 29, 27)];
    [_touchable4 setImage:[UIImage imageNamed:@"04_greenPoint@2x.png"] forState:UIControlStateNormal];
    [_touchable4 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable4];
    
    _touchable5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable5 setFrame:CGRectMake(2800, 70, 29, 27)];
    [_touchable5 setImage:[UIImage imageNamed:@"02_iconRewards@2x.png"] forState:UIControlStateNormal];
    [_touchable5 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable5];
    
    _touchable6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable6 setFrame:CGRectMake(3800, 30, 29, 27)];
    [_touchable6 setImage:[UIImage imageNamed:@"04_greenPoint@2x.png"] forState:UIControlStateNormal];
    [_touchable6 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable6];
    
    _touchable7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable7 setFrame:CGRectMake(4000, 50, 29, 27)];
    [_touchable7 setImage:[UIImage imageNamed:@"04_greenPoint@2x.png"] forState:UIControlStateNormal];
    [_touchable7 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable7];
    
    _touchable8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable8 setFrame:CGRectMake(4200, 60, 29, 27)];
    [_touchable8 setImage:[UIImage imageNamed:@"04_orangePoint@2x.png"] forState:UIControlStateNormal];
    [_touchable8 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable8];
    
    _touchable9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable9 setFrame:CGRectMake(4200, 80, 29, 27)];
    [_touchable9 setImage:[UIImage imageNamed:@"04_orangePoint@2x.png"] forState:UIControlStateNormal];
    [_touchable9 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable9];
    
    _touchable10 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable10 setFrame:CGRectMake(3200, 70, 29, 27)];
    [_touchable10 setImage:[UIImage imageNamed:@"04_orangePoint@2x.png"] forState:UIControlStateNormal];
    [_touchable10 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable10];
    
    _touchable11 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable11 setFrame:CGRectMake(1200, 60, 29, 27)];
    [_touchable11 setImage:[UIImage imageNamed:@"02_iconRewards@2x.png"] forState:UIControlStateNormal];
    [_touchable11 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable11];
    
    _touchable12 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable12 setFrame:CGRectMake(5200, 30, 29, 27)];
    [_touchable12 setImage:[UIImage imageNamed:@"04_orangePoint@2x.png"] forState:UIControlStateNormal];
    [_touchable12 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable12];
    
    _touchable13 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable13 setFrame:CGRectMake(3600, 40, 29, 27)];
    [_touchable13 setImage:[UIImage imageNamed:@"04_orangePoint@2x.png"] forState:UIControlStateNormal];
    [_touchable13 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable13];
    
    _touchable14 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchable14 setFrame:CGRectMake(5300, 50, 29, 27)];
    [_touchable14 setImage:[UIImage imageNamed:@"02_iconRewards@2x.png"] forState:UIControlStateNormal];
    [_touchable14 addTarget:self action:@selector(touchablesTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchable14];
    
    /*[UIView animateWithDuration:3.0 animations:^{
        touchable.transform = CGAffineTransformMakeTranslation(-600, 30);
    }];*/
    
    [UIView animateWithDuration:18.0 delay:0.0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{
        _touchable.transform = CGAffineTransformMakeTranslation(-850, 30);
        _touchable2.transform = CGAffineTransformMakeTranslation(-1650, 40);
        _touchable3.transform = CGAffineTransformMakeTranslation(-1950, 50);
        _touchable4.transform = CGAffineTransformMakeTranslation(-1650, 70);
        _touchable5.transform = CGAffineTransformMakeTranslation(-2850, 80);
        _touchable6.transform = CGAffineTransformMakeTranslation(-3850, 30);
        _touchable7.transform = CGAffineTransformMakeTranslation(-4650, 50);
        _touchable8.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable9.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable10.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable11.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable12.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable13.transform = CGAffineTransformMakeTranslation(-4250, 70);
        _touchable14.transform = CGAffineTransformMakeTranslation(-4250, 70);
    } completion:nil];
    
    /*_buttonTimer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(moveTouchable) userInfo:nil repeats:YES];*/
    
}

/*- (void)moveTouchable {
    _touchable.frame = CGRectMake(300, 30, 19, 17);
}*/

- (void)touchablesTouched {
    NSLog(@"tekan");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
        if ([_touchable.layer.presentationLayer hitTest:touchLocation])
        {
            // This button was hit whilst moving - do something with it here
            NSLog(@"tekaned");
            [_touchable removeFromSuperview];
        }
    
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
