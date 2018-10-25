//
//  NSMutableString+quick.h
//  YDCY
//
//  Created by stephendsw on 15/9/24.
//  Copyright © 2015年 GJ All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (quick)


/**
 *  链接线
 *
 */
-(void)setLinkString:(NSString *)str;

/**
 *  中划线
 *
 */
-(void)setUnderlineString:(NSString *)str;

/**
 *   下划线
 *
 */
- (void)setBelowlineString:(NSString *)str;

- (void)setColor:(UIColor *)color string:(NSString *)str;
- (void)setColor:(UIColor *)color;

- (void)setFont:(UIFont *)font string:(NSString *)str;
- (void)setFont:(UIFont *)font;

- (void)setParagraphStyle:(void (^)(NSMutableParagraphStyle *Paragraph))block;

@end
