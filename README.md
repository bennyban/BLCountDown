# BLCountDown
倒计时的一个小例子
```
[BLCountdownManage beginCountWithDuration:10 retainTime:^(NSInteger retain) {
        NSString *title = [NSString stringWithFormat:@"剩余:%ds",retain];
        [_btnCountDown setTitle:title forState:UIControlStateNormal];
        [_btnCountDown setBackgroundColor:[UIColor grayColor]];
        _btnCountDown.userInteractionEnabled = NO;
        
    } completion:^(BOOL finished) {
        
        [_btnCountDown setTitle:@"重新获取" forState:UIControlStateNormal];
        _btnCountDown.userInteractionEnabled = YES;
        _btnCountDown.backgroundColor = [UIColor orangeColor];
    }
];
 ```

