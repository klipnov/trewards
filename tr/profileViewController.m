//
//  profileViewController.m
//  tr
//
//  Created by Aliff Ali Azizan on 9/18/14.
//  Copyright (c) 2014 Qays. All rights reserved.
//

#import "profileViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AFNetworking/AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface profileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) NSTimer *pointTimer;
@property (strong, nonatomic) NSTimer *totalTimer;

@property int currentPoint;
@property int currentTotal;

@property (weak, nonatomic) IBOutlet UILabel *tierLabel;
@property (weak, nonatomic) IBOutlet UILabel *ecoSaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *rewardsLabel;

@end

@implementation profileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [FBRequestConnection startWithGraphPath:@"me" parameters:[NSMutableDictionary  dictionaryWithObjectsAndKeys:@"name,picture",@"fields", nil] HTTPMethod:@"GET" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSLog(@"%@",result);
        NSDictionary *dictionary = result;
        NSString *name = [[dictionary objectForKey:@"name"] uppercaseString];
        _username.text = name;
        
        NSString *urlString = [dictionary valueForKeyPath:@"picture.data.url"];
        [_profilePic setImageWithURL:[NSURL URLWithString:urlString]];
    }];
    
    [self initLabels];
    [self initBottomLabels];

    
     _pointTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(addNumbersToPoint) userInfo:nil repeats:YES];
    
       _totalTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(addNumbersToTotal) userInfo:nil repeats:YES];
    
}

- (void)initLabels {
    _pointLabel.text = @"0";
    _totalLabel.text = @"0";
}

- (void)initBottomLabels {
    _tierLabel.alpha = 0;
    _ecoSaveLabel.alpha = 0;
    _rewardsLabel.alpha = 0;
}

- (void)addNumbersToPoint {
    
    if (_currentPoint < 1324) {
        _currentPoint++;
        _pointLabel.text = [NSString stringWithFormat:@"%d",_currentPoint];
    } else {
        [_pointTimer invalidate];
    }
    
    if (_currentPoint > 100) {
        [self animateBottomLabels];
    }

    
}

- (void)addNumbersToTotal {
    
    if (_currentTotal < 135600) {
        _currentTotal = _currentTotal + 51;
        _totalLabel.text = [NSString stringWithFormat:@"%d",_currentTotal];
    } else {
        [_totalTimer invalidate];
    }
    
    
}

- (void)animateBottomLabels {
    
    /*[UIView animateWithDuration:1.0 animations:^{
        _tierLabel.alpha = 1;
        _ecoSaveLabel.alpha = 1;
        _rewardsLabel.alpha = 1;
    }];*/
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _tierLabel.alpha = 1;
        _ecoSaveLabel.alpha = 1;
        _rewardsLabel.alpha = 1;
        
    } completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
