//
//  YGColorManager.h
//  SPdemo
//
//  Created by liubo on 2020/3/24.
//  Copyright © 2020 刘波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface YGColorManager : NSObject
+ (instancetype)sharedInstance;
- (UIColor *)YGTextWhite;
@end
NS_ASSUME_NONNULL_END
