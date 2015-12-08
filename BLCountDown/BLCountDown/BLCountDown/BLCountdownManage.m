//
//  BLCountdownManage.m
//  BLCheckCodeTime
//
//  Created by 班磊 on 15/12/7.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "BLCountdownManage.h"

@interface BLCountdownManage ()

@property (nonatomic, strong) NSTimer  *repeatTimer;     /**< 计时器 */
@property (nonatomic, assign) NSInteger count;           /**< 当前的count */
@property (nonatomic, assign) BOOL      invalidCheckCode;/**< 是否有效Code */
@property (nonatomic, strong) RetainTimeBlock retainTime;/**< 剩余时间 */
@property (nonatomic, strong) CompletionBlock complete;  /**< 倒计时完成 */


@end

@implementation BLCountdownManage

+ (BLCountdownManage *)share
{
    static BLCountdownManage *globleCountDown = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ globleCountDown = [[self alloc] init];});
    return globleCountDown;
}

+ (void)beginCountWithDuration:(NSTimeInterval)timeInterval retainTime:(RetainTimeBlock)retainTime completion:(CompletionBlock)completed
{
    [BLCountdownManage share].retainTime = retainTime;
    [BLCountdownManage share].complete = completed;
    
    if ([[BLCountdownManage share].repeatTimer isValid]) {
        [[BLCountdownManage share].repeatTimer invalidate];
    }
    
    [BLCountdownManage share].count = timeInterval;
    [BLCountdownManage share].invalidCheckCode = NO;
    
    [[BLCountdownManage share] setUpTimer];
}

- (void)setUpTimer
{
    _repeatTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(resendCountDown) userInfo:nil repeats:YES];
}

+ (BOOL)isCounting
{
    if ([BLCountdownManage share].count > 0) {
        return YES;
    }
    return NO;
}

+ (void)stopCount
{
    [[BLCountdownManage share].repeatTimer invalidate];
    [BLCountdownManage share].count = 0;
    [BLCountdownManage share].complete (YES);
}

/**
 *	@brief	计数器方法
 */
- (void)resendCountDown
{
    --_count;
    
    if (_count == 0) {
        [_repeatTimer invalidate];
        _repeatTimer = nil;
        _invalidCheckCode = YES;
        _complete (YES);
    } else
    {
        _retainTime ( _count );
    }
}

- (void)dealloc {
    [BLCountdownManage stopCount];
}

@end
