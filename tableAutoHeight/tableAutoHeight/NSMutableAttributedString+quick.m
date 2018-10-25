//
//  NSMutableString+quick.m
//  YDCY
//
//  Created by stephendsw on 15/9/24.
//  Copyright © 2015年 GJ All rights reserved.
//

#import "NSMutableAttributedString+quick.h"
#import <UIKit/UIKit.h>

@implementation NSMutableAttributedString (quick)


-(void)setLinkString:(NSString *)str
{
    [self addAttribute:NSLinkAttributeName value:@"" range:[self.string rangeOfString:str]];
}

- (void)setUnderlineString:(NSString *)str {
    [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[self.string rangeOfString:str]];
}

- (void)setBelowlineString:(NSString *)str {
   [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[self.string rangeOfString:str]];
}
- (void)setColor:(UIColor *)color string:(NSString *)str {
    [self addAttribute:NSForegroundColorAttributeName value:color range:[self.string rangeOfString:str]];
}

- (void)setColor:(UIColor *)color {
    [self addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
}

- (void)setFont:(UIFont *)font string:(NSString *)str {
    [self addAttribute:NSFontAttributeName value:font range:[self.string rangeOfString:str]];
}

- (void)setFont:(UIFont *)font {
    [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
}

- (void)setParagraphStyle:(void (^)(NSMutableParagraphStyle *Paragraph))block {
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc]init];

    block(p);
    [self addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, self.length)];
}

@end
