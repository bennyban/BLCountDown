//
//  ViewController.m
//  BLCountDown
//
//  Created by 班磊 on 15/12/8.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "ViewController.h"
#import "BLCountdownManage.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btnCountDown;   /**< 倒计时操作 */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btnCountDown = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCountDown.frame = CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width - 200, 60);
    _btnCountDown.backgroundColor = [UIColor orangeColor];
    _btnCountDown.layer.cornerRadius = 3.0;
    _btnCountDown.layer.masksToBounds = YES;
    _btnCountDown.layer.borderColor = [UIColor cyanColor].CGColor;
    _btnCountDown.layer.borderWidth = 1.0f;
    [_btnCountDown setTitle:@"获取验证" forState:UIControlStateNormal];
    [_btnCountDown addTarget:self action:@selector(doActionToCountDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCountDown];
}

- (void)doActionToCountDown
{
    [BLCountdownManage beginCountWithDuration:10 retainTime:^(NSInteger retain) {
        NSString *title = [NSString stringWithFormat:@"剩余:%ds",retain];
        [_btnCountDown setTitle:title forState:UIControlStateNormal];
        [_btnCountDown setBackgroundColor:[UIColor grayColor]];
        _btnCountDown.userInteractionEnabled = NO;
        
    } completion:^(BOOL finished) {
        
        [_btnCountDown setTitle:@"重新获取" forState:UIControlStateNormal];
        _btnCountDown.userInteractionEnabled = YES;
        _btnCountDown.backgroundColor = [UIColor orangeColor];
    }];
}

@end
