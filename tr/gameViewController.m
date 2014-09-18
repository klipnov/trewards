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

@end

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:30.0 animations:^{
        _cloudsImg.transform = CGAffineTransformMakeTranslation(-300, 0);
    } completion:^(BOOL finished) {
        NSLog(@"done anim ?:%hhd", finished);
    }];
    
    [UIView animateWithDuration:10.0 animations:^{
        _groundImg.transform = CGAffineTransformMakeTranslation(-400, 0);
    } completion:^(BOOL finished) {
        _groundImg.frame = CGRectMake(0, 0, 568, 97);
    }];
    
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
