//
//  UIColor+Hex.m
//  SPdemo
//
//  Created by liubo on 2020/3/24.
//  Copyright © 2020 刘波. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor *)ColorWithHexString:(NSString *)color {
    return [UIColor ColorwithHexString:color Alpha:-1];
}
+ (UIColor *)ColorwithHexString:(NSString *)color Alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 8 && [cString length]!=6)
        return [UIColor clearColor];

    CGFloat insideAlpha = 1.0f;
    if ([cString length]==8) {
        NSString *aString = [cString substringWithRange:NSMakeRange(0, 2)];
        unsigned int a;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        insideAlpha = (float)a / 255.0f;
        cString =  [cString substringWithRange:NSMakeRange(2, 6)];
    }
    if (alpha>0) {
        insideAlpha = alpha;
    }

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;

    //r
    NSString *rString = [cString substringWithRange:range];

    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:insideAlpha];
}
@end
