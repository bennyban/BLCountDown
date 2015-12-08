//
//  BLCountdownManage.h
//  BLCheckCodeTime
//
//  Created by 班磊 on 15/12/7.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RetainTimeBlock)(NSInteger retain);  /**< 倒计时剩余时间 */
typedef void(^CompletionBlock)(BOOL finished);     /**< 倒计时结束 */

@interface BLCountdownManage : NSObject

/*!
 *  @brief  开启倒计时
 *
 *  @param timeInterval 间隔时间
 *  @param retainTime   倒计时剩余时间
 *  @param completed    倒计时完成
 */
+ (void)beginCountWithDuration:(NSTimeInterval)timeInterval retainTime:(RetainTimeBlock)retainTime completion:(CompletionBlock)completed;

+ (BOOL)isCounting;

+ (void)stopCount;

@end
