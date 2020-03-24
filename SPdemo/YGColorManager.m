//
//  YGColorManager.m
//  SPdemo
//
//  Created by liubo on 2020/3/24.
//  Copyright © 2020 刘波. All rights reserved.
//

#import "YGColorManager.h"
#import "UIColor+Hex.h"

@implementation YGColorManager

+ (instancetype)sharedInstance {
    static YGColorManager * _manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _manager = [[super allocWithZone:NULL] init];
    });
    return _manager;
}
// 防止外部调用alloc 或者 new
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [YGColorManager sharedInstance];
}
// 防止外部调用copy
- (id)copyWithZone:(nullable NSZone *)zone {
    return [YGColorManager sharedInstance];
}
// 防止外部调用mutableCopy
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [YGColorManager sharedInstance];
}
- (UIColor *)YGTextWhite
{
    return [self colorWithArray:@[@"#DC143C",@"#1E90FF"]];
}


- (UIColor *)colorWithArray:(NSArray *)colorArray{
    if (colorArray == nil || colorArray.count == 0) {
        return [UIColor whiteColor];
    }
    if (@available(iOS 13.0, *)) {
        UIColor * color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection)
        {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight)
            {
                return [UIColor ColorWithHexString:colorArray.firstObject] ;
            }
            else if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)
            {
                return  [UIColor ColorWithHexString:colorArray.lastObject];
            }
            return [UIColor whiteColor];
        }];
        return color;
    }
    return [UIColor whiteColor];
}
@end

